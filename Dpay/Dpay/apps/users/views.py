import re

from django.http import JsonResponse
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View
from django import http
from django.views.decorators.csrf import csrf_exempt
from users.models import User
# Create your views here.

# Register interface


class RegisterView(View):
    @method_decorator(csrf_exempt)
    def post(self, request):

        user_name = request.POST.get("user_name")
        pwd = request.POST.get("pwd")
        cpwd = request.POST.get("cpwd")
        phone = request.POST.get("phone")
        msg_code = request.POST.get("msg_code")
        allow = request.POST.get("allow")

        if not all([user_name, pwd, cpwd, phone, msg_code, allow]):
            return http.HttpResponseForbidden("参数不全")

        if pwd != cpwd:
            return http.HttpResponseForbidden("两次密码不一致")

        if not re.match(r'^1[3-9]\d{9}$', phone):
            return http.HttpResponseForbidden("手机号格式有误")

        print("msg_code = %s" % msg_code)

        if allow != 'on':
            return http.HttpResponseForbidden("协议需要同意")

        user = User.objects.create_user(username=user_name, password=pwd, mobile=phone)

        return JsonResponse({'succ':1},safe=False)

class CheckUsernameView(View):
        def get(self, request, username):
            # 1, 根据用户名查询用户数量
            count = User.objects.filter(username=username).count()
            print(count)
            # 2, 返回响应
            return http.JsonResponse({"count": count, "code": 0})


class CheckMobileView(View):
    def get(self, request, mobile):
        # 1, 根据用户名查询用户数量
        count = User.objects.filter(mobile=mobile).count()
        print(count)
        # 2, 返回响应
        return http.JsonResponse({"count": count, "code": 0})