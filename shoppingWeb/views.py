from django.db.models import F
from django.shortcuts import render

# Create your views here.
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
