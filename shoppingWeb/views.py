from collections import defaultdict

from django.db.models import F
from django.shortcuts import render

# Create your views here.
from django.views import View
from django_pandas.io import read_frame
from surprise import Reader, Dataset, SVD, KNNBasic

from shoppingWeb.models import *
from django.http import HttpResponse, JsonResponse
from django.forms.models import model_to_dict
from django.core import serializers
from django.core.mail import send_mail
import json
import hashlib
from decimal import Decimal
# Create your views here.

def check_status(fn):
    def wrapper(request, *args, **kwargs):
        if 'username' not in request.session or 'uid' not in request.session:
            return JsonResponse({'status': '0', 'message': 'user not login'})
        return fn(request, *args, **kwargs)

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
                                           name=name,
                                           gender=gender,
                                           email=email,
                                           )
                # add uid to session
                request.session['username'] = user.username
                request.session['uid'] = user.id
                # set 1 day as expiry time
                request.session.set_expiry(60 * 60 * 12)
            except Exception as e:
                message = 'username exists'
                status = 0
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


@check_status
def login_view(request):
    # only accept post method
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
        user = User.objects.filter(username=username, password=password)
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
            json_data = json.loads(serializers.serialize('json', data))
            json_data[0]['fields']['amount'] = quantity
            res[f'commodity {count}'] = json_data
            message = 'success'
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
        res = json.loads(serializers.serialize('json', res))
        status = 1
        response['data'] = res
        message = 'success'
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def group_buying_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'GET':
        res = group_buying.objects.all()[:15]
        res = json.loads(serializers.serialize('json',res))
        status = 1
        response['data'] = res
        message = 'success'

    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def create_group_buying_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'POST':
        username = request.POST.get('username')
        user = User.objects.filter(username=username)
        commodityID = request.POST.get('commodityID')
        commodity = Commodity.objects.filter(id=commodityID)
        if not user.exists():
            message = 'username does not exists'
        elif not commodity:
            message = 'commodity does not exists'
        else:
            status = 1
            message = 'success'
            price = commodity[0].price
            discounting_rate = 1
            token = request.POST.get('token')
            try:
                o = group_buying.objects.create(
                    price = price,
                    discounting_rate = discounting_rate,
                    commodity_ID = commodity[0],
                    initiator = username,
                    identity_token = token,
                )
                response['id'] = o.id
            except Exception as e:
                print(e)
                message = 'create failed'
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def search_group_buying_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'GET':
        #g_id = ID of a group buying
        g_id = request.GET.get('group_id')
        try:
            gb = group_buying.objects.get(id=g_id)
            data = model_to_dict(gb)
            response['data'] = data
            status = 1
            message = 'success'
        except Exception as e:
            print(e)
            message = 'ID do not match any group buying activate'
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def delete_group_buying_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'DELETE':
        try:
            g_id = request.GET.get('group_id')
            gb = group_buying.objects.get(id = g_id)
            gb.delete()
            message = 'success'
            status = 1
        except Exception as e:
            message = 'ID do not match any group buying activate '
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def sharing_discounting_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'GET':
        # sd_id = request.GET.get('sharing_id')
        # try:
        #     sd = group_buying.objects.filter()
        res = sharing_discounting.objects.all()[:15]
        res = json.loads(serializers.serialize('json', res))
        status = 1
        response['data'] = res
        message = 'success'
        
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def create_discounting_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'POST':
        username = request.POST.get('username')
        user = User.objects.filter(username=username)
        commodityID = request.POST.get('commodityID')
        commodity = Commodity.objects.filter(id=commodityID)
        if not user.exists():
            message = 'username does not exists'
        elif not commodity:
            message = 'commodity does not exists'
        else:
            status = 1
            message = 'success'
            price = commodity[0].price
            discounting_rate = 1
            token = request.POST.get('token')
            helped_list = ''
            try:
                o = sharing_discounting.objects.create(
                    price = price,
                    discounting_rate = discounting_rate,
                    commodity_ID = commodity[0],
                    initiator = user[0],
                    identity_token = token,
                    helped_list = helped_list
                )
                response['id'] = o.id
            except Exception as e:
                print(e)
                message = 'create failed'
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def search_discounting_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'GET':
        # s_id = ID of a sharing and discounting
        s_id = request.GET.get('discounting_id')
        try:
            sd = sharing_discounting.objects.get(id=s_id)
            data = model_to_dict(sd)
            response['data'] = data
            status = 1
            message = 'success'
        except Exception as e:
            print(e)
            message = 'ID do not match any sharing and discounting activate'
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def delete_discounting_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'DELETE':
        try:
            s_id = request.GET.get('discounting_id')
            sd = sharing_discounting.objects.get(id = s_id)
            sd.delete()
            message = 'success'
            status = 1
        except Exception as e:
            message = 'ID do not match any sharing and discounting activate '
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def get_discounting_by_token_view(request):
    status = 0
    message = 'failed'
    response = {}
    ds_rate = 0.1
    if request.method == 'POST':
        try:
            username = request.POST.get('username')
            token = request.POST.get('token')
            sd = sharing_discounting.objects.get(identity_token=token)
            helped_list = sd.helped_list
            initiator = sd.initiator.username
            if initiator == username:
                message = 'initiator cannot help himself'
                raise Exception(message)
            user = User.objects.filter(username=username)
            if not user.exists():
                raise Exception('user is not registered')
            if helped_list == '':
                helped_list = username
                print(helped_list)
                message = 'success'
                status = 1
                sd.discounting_rate = 1 - ds_rate
                sd.helped_list = helped_list
                sd.save()
            else:
                L = helped_list.split(',')
                if username in L:
                    message = 'You have helped'
                    raise Exception(message)
                else:
                    message = 'success'
                    helped_list = helped_list + ',' + username
                    f = Decimal(ds_rate/pow(2,len(L)))
                    sd.discounting_rate = sd.discounting_rate - f
                    sd.helped_list = helped_list
                    sd.save()
        except Exception as e:
            print(e)
            message = e.__str__()
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)


def get_helped_list_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'GET':
        token = request.GET.get('token')
        try:
            data = {}
            ds = sharing_discounting.objects.get(identity_token=token)
            data['list'] = ds.helped_list.split(',')
            data['discounting_rate'] = ds.discounting_rate
            response['data'] = data
            status = 1
            message = 'success'
        except Exception as e:
            message = 'token is incorrect'
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def create_order_view(request):
    status = 0
    message = 'failed'
    response = {}
    if request.method == 'POST':
        # username = request.POST.get('username')
        # commodities = request.POST.get('commodityID')
        # payment_method = request.POST.get('payment_method')
        # data = request.POST.get('data')
        #payment_amount = request.POST.get('payment_amount')

        #print(request.body)
        data = json.loads(request.body)
        username = data['username']
        payment_method = data['payment_method']
        sum = 0
        try:
            user = User.objects.get(username=username)
            order = Order.objects.create(
                buyer=user,
                payment_method=payment_method,
                payment_amount=sum,
            )
            message = 'success'
            status = 1
        except Exception as e:
            message = e.__str__()
        str = ''
        for _ in data['data']:
            print(_)
            print(_['amount'])
            print(_['introduce'])
            try:
                commodity = Commodity.objects.get(name=_['introduce'])
                amount = _['amount']
                str += f'  commodity : {commodity.name}, amount:{amount}\n'
                sum = sum + commodity.price * Decimal(amount)
                order_Commodities = Order_Commodities.objects.create(amount= amount,
                                             order = order,
                                             commodity = commodity)
            except Exception as e:
                print(e)
                message = 'Commodity name is incorrect'
                status = 1
        print('---------')
        order.payment_amount = sum
        order.save()
        print('---------')
        body = f'Dear {username}: \n This is a recipient from Dpay.\nPlease check the below:\n' \
               f' {str}\n  total price = {sum}\n Best wishes.'
        send_mail(
            subject='Thanks for shopping at Dpay',
            message=body,
            from_email='gj_chw@126.com',  #
            recipient_list=['riley.lxr@gmail.com'],  #
            fail_silently=False
        )
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

class RecommendSystemView(View):
    def get(self, request):
        qset = Comment.objects.all()
        df = read_frame(qset)
        print(df)


        reader = Reader(rating_scale=(1, 5))

        # The columns must correspond to user id, item id and ratings (in that order).
        surprise_data = Dataset.load_from_df(df[['user_id', 'commodity_ID', 'Rating']], reader)

        all_trainset = surprise_data.build_full_trainset()

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
        algo = KNNBasic(k=40, min_k=3, sim_options={
            'user_based': False})
        algo.fit(all_trainset)
        # Than predict ratings for all pairs (u, i) that are NOT in the training set.
        testset = all_trainset.build_anti_testset()
        predictions = algo.test(testset)
        top_n = get_top_n(predictions, n=6)
        # print(top_n)
        for uid, user_ratings in top_n.items():
            lst = [iid for (iid, _) in user_ratings]
            # print(lst)
            user_recommend.objects.update_or_create(user_id=uid,
                                                    user_recommended=lst)

        item_algo = KNNBasic(k=40, min_k=3, sim_options={
            'user_based': False})
        item_algo.fit(all_trainset)

        def getSimilarItems(top_k, item_id):
            item_inner_id = item_algo.trainset.to_inner_iid(item_id)
            item_neighbors = item_algo.get_neighbors(item_inner_id, k=top_k)
            f_item_neighbors = (item_algo.trainset.to_raw_iid(inner_id)
                                for inner_id in item_neighbors)
            return f_item_neighbors

        itemset = set(list(df['commodity_ID']))
        for item in itemset:
            ilst = list(getSimilarItems(6, item))
            item_recommend.objects.update_or_create(commodity_ID=item,
                                                    commodity_recommended=ilst)

        return JsonResponse({"msg:": "Success refresh recommend system!"})


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
        return JsonResponse({"questionrecommend": result})
