from collections import defaultdict

from django.db.models import F
from django.shortcuts import render

# Create your views here.
from django.views import View
from django_pandas.io import read_frame
from surprise import Reader, Dataset, SVD, KNNBasic

from shoppingWeb.models import *
from django.http import HttpResponse,JsonResponse
from django.forms.models import model_to_dict
from django.core import serializers
import json
import hashlib
# Create your views here.

def check_status(fn):

    def wrapper(request,*args,**kwargs):
        if 'username' not in request.session or 'uid' not in request.session:
            return JsonResponse({'status': '0','message': 'user not login'})
        return fn(request,*args,**kwargs)

    return wrapper


def register_view(request):
    response = {}
    message = 'failed'
    status = 0
    if request.method == 'POST':
        username = request.POST.get('username')
        user = User.objects.filter(username=username)
        if user.exists():
            message = 'username exists'
        else:
            message = 'success'
            status = 0
            # get data
            password = request.POST.get('password')
            birth = request.POST.get('birth')
            name = request.POST.get('name')
            gender = request.POST.get('gender')
            email = request.POST.get('email')

            # encode password
            md5 = hashlib.md5()
            md5.update(password.encode())
            password = md5.hexdigest()

            try:
                user = User.objects.create(username=username,
                                    password=password,
                                    birth=birth,
                                    name = name,
                                    gender=gender,
                                    email=email,
                                    )
                # add uid to session
                request.session['username'] = user.username
                request.session['uid'] = user.id
                # set 1 day as expiry time
                request.session.set_expiry(60*60*12)
            except Exception as e:
                message = 'username exists'
                status = 0
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def login_view(request):
    #only accept post method
    response = {}
    message = 'failed'
    status = 0
    if request.method == 'GET':
        # check whether uid is in session
        if request.session.get('username') and request.session.get('uid'):
            message = 'success'
            status = 2
            return JsonResponse(response)
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        # encode password
        md5 = hashlib.md5()
        md5.update(password.encode())
        password = md5.hexdigest()
        user = User.objects.filter(username=username,password=password)
        if user.exists():
            message = 'success'
            status = 1
            request.session['username'] = user[0].username
            request.session['uid'] = user[0].username
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def logout_view(request):
    if 'username' in request.session:
        del request.session['username']
    if 'uid' in request.session:
        del request.session['uid']

    response = {}
    response['message'] = 'success'
    response['status'] = 0
    return JsonResponse(response)

def userInformation_view(request):
    status = 0
    message = "failed"
    response = {}
    if request.method == 'GET':
        username = request.GET.get('username')
        user = User.objects.filter(username=username)
        try:
            res = model_to_dict(user[0])
            status = 1
            message = 'success'
            del res['password']
            response['data'] = res
        except Exception as e:
            message = 'username does not exist'

    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def cart_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'GET':
        username = request.GET.get('username')
        # res =  json.loads(serializers.serialize('json',user.cart_set.all()))
        # response['data'] = res
        userID = User.objects.filter(username=username)[0].id
        res = {}
        count = 0
        for i in Cart.objects.filter(buyer_id=userID):
            ID = i.commodity_id_id
            quantity = i.quantity
            data = Commodity.objects.filter(id=ID)
            json_data = json.loads(serializers.serialize('json',data))
            json_data[0]['fields']['amount'] = quantity
            res[f'commodity {count}'] = json_data
            count += 1
        response['data'] = res
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def commodity_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'GET':
        res = Commodity.objects.all()[:15]
        res = json.loads(serializers.serialize('json',res))
        status = 1
        response['data'] = res
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


class RecommendSystemView(View):
    def get(self, request ):
        qset = Comment.objects.all()
        df = read_frame(qset)
        print(df)

        # mark = rating.objects.filter(id= userid).values('Rating')
        # print(mark)

        # file_path = os.path.expanduser('item_user_rate_time.txt')
        # reader = Reader(line_format='user item rating timestamp', sep=',')

        # A reader is still needed but only the rating_scale param is requiered.
        reader = Reader(rating_scale=(1, 5))

        # The columns must correspond to user id, item id and ratings (in that order).
        surprise_data = Dataset.load_from_df(df[['user_id', 'commodity_ID', 'Rating']], reader)



        all_trainset = surprise_data.build_full_trainset()
        # algo = KNNBasic(k=40, min_k=3, sim_options={
        #     'user_based': True})  # sim_options={'name': 'cosine','user_based': True} cosine/msd/pearson/pearson_baseline
        # algo.fit(all_trainset)
        #
        # def getSimilarUsers(top_k, u_id):
        #     user_inner_id = algo.trainset.to_inner_uid(u_id)
        #     user_neighbors = algo.get_neighbors(user_inner_id, k=top_k)
        #     user_neighbors = (algo.trainset.to_raw_uid(inner_id) for inner_id in user_neighbors)
        #     return user_neighbors
        #
        #
        # print("recommend product is :",list(getSimilarUsers(5, 9)))
        def get_top_n(predictions, n=10):

            # First map the predictions to each user.
            top_n = defaultdict(list)
            for uid, iid, true_r, est, _ in predictions:
                top_n[uid].append((iid, est))

            # Then sort the predictions for each user and retrieve the k highest ones.
            for uid, user_ratings in top_n.items():
                user_ratings.sort(key=lambda x: x[1], reverse=True)
                top_n[uid] = user_ratings[:n]

            return top_n

        algo = SVD()
        algo.fit(all_trainset)

        # Than predict ratings for all pairs (u, i) that are NOT in the training set.
        testset = all_trainset.build_anti_testset()
        predictions = algo.test(testset)

        top_n = get_top_n(predictions, n=5)
        # print(top_n)
        for uid, user_ratings in top_n.items():
            # print(uid, [iid for (iid, _) in user_ratings])
            lst = [iid for (iid, _) in user_ratings]
            # print(lst)
            user_recommend.objects.update_or_create(user_id=uid,
                                                    user_recommended=lst)
            # print(uid,','.join(lst))



        item_algo = KNNBasic(k=40, min_k=3, sim_options={
            'user_based': False})  # sim_options={'name': 'cosine','user_based': True} cosine/msd/pearson/pearson_baseline
        item_algo.fit(all_trainset)




        def getSimilarItems(top_k, item_id):
            item_inner_id = item_algo.trainset.to_inner_iid(item_id)
            item_neighbors = item_algo.get_neighbors(item_inner_id, k=top_k)
            f_item_neighbors = (item_algo.trainset.to_raw_iid(inner_id)
                                for inner_id in item_neighbors)
            return f_item_neighbors

        # print("item based recommend product is :",list(getSimilarItems(5, 6797)))


        # userset = set(list(df['UID']))
        # for user in userset:
        #     print("user",user,"recommend product is :", list(getSimilarUsers(5, user)))


        itemset = set(list(df['commodity_ID']))
        for item in itemset:
            # print("item",item,"item based recommend product is :", list(getSimilarItems(5, item)))
            ilst = list(getSimilarItems(5, item))
            item_recommend.objects.update_or_create(commodity_ID=item,
                                                    commodity_recommended=ilst)

        return JsonResponse({"msg:":"Success refresh recommend system!"})



class GetUserRecommendView(View):
    def get(self, request, userid):
        res = user_recommend.objects.filter(user_id=userid).last()
        print(res.user_recommended)
        return JsonResponse({"userid": res.user_id, "userrecommended": res.user_recommended})

class GetItemRecommendView(View):
    def get(self, request, itemid):
        res = item_recommend.objects.filter(commodity_ID=itemid).last()
        print(res.commodity_ID)
        return JsonResponse({"itemid": res.commodity_ID, "itemrecommended": res.commodity_recommended})

class QuestionRecommendView(View):
    def get(self, request, category):
        result = []
        for everychar in category:
            print(everychar)
            res = Commodity.objects.filter(category=everychar).order_by('sales').last()
            print(res.name)
            result.append(res.id)
        # res = item_recommend.objects.filter(commodity_ID=category).last()
        # print(res.commodity_ID)
        # return http.JsonResponse({"itemid": res.commodity_ID, "itemrecommended": res.commodity_recommended})
        return JsonResponse({"questionrecommend": result})
