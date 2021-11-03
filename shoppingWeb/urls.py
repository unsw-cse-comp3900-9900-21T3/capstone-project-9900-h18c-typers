from django.contrib import admin
from django.urls import path,re_path,include
from . import views

urlpatterns = [
    path('login', views.login_view),
    path('register',views.register_view),
    path('logout',views.logout_view),
    path('commodity',views.commodity_view),
    re_path(r'^get_userInfo', views.userInformation_view),
    re_path(r'^get_cart', views.cart_view),
]