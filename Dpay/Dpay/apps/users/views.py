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
        # 1, 获取参数
        user_name = request.POST.get("user_name")
        pwd = request.POST.get("pwd")
        cpwd = request.POST.get("cpwd")
        phone = request.POST.get("phone")
        msg_code = request.POST.get("msg_code")
        allow = request.POST.get("allow")

        # 2, 校验参数
        # 2,1 为空校验
        if not all([user_name, pwd, cpwd, phone, msg_code, allow]):
            return http.HttpResponseForbidden("参数不全")

        # 2,2 两次密码一致
        if pwd != cpwd:
            return http.HttpResponseForbidden("两次密码不一致")

        # 2,3 手机号格式正确
        if not re.match(r'^1[3-9]\d{9}$', phone):
            return http.HttpResponseForbidden("手机号格式有误")

        # 2,5 短信验证码正确(下一次完成)
        print("msg_code = %s" % msg_code)

        # 2,6 协议需要同意
        if allow != 'on':
            return http.HttpResponseForbidden("协议需要同意")

        # 3, 数据入库
        user = User.objects.create(username=user_name, password=pwd, mobile=phone)

        # 4, 返回响应
        return JsonResponse({'succ':1},safe=False)
