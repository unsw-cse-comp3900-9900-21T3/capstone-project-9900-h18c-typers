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
    re_path(r'^group_buying', views.group_buying_view),
    path('create_group_buying',views.create_group_buying_view),
    re_path(r'^delete_group_buying',views.delete_group_buying_view),
    re_path(r'^search_group_buying', views.search_group_buying_view),

    re_path(r'^discounting',views.sharing_discounting_view),
    re_path(r'^create_discounting',views.create_discounting_view),
    re_path(r'^delete_discounting',views.delete_discounting_view),
    re_path(r'^search_discounting',views.search_discounting_view),
    re_path(r'^get_discounting_by_token',views.get_discounting_by_token_view),
    re_path(r'get_helped_list',views.get_helped_list_view),
    path('create_order',views.create_order_view),
]