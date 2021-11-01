from django.shortcuts import render

# Create your views here.
from shoppingWeb.models import *
from django.http import HttpResponse,JsonResponse
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
            request.session['username'] = user.username
            request.session['uid'] = user.id
    response['message'] = message
    response['status'] = status
    return JsonResponse(response)

def logout_view(request):
    if 'username' in request.session:
        del request.session['username']
    if 'uid' in request.session:
        del request.session['uid']

    response = { }
    response['message'] = 'success'
    response['status'] = 0
    return JsonResponse(response)