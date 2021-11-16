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
    path(r'recommend/', views.RecommendSystemView.as_view()),
    path(r'userrecommend/<int:userid>/', views.GetUserRecommendView.as_view()),
    path(r'itemrecommend/<int:itemid>/', views.GetItemRecommendView.as_view()),
    path(r'questionrecommend/<category>/', views.QuestionRecommendView.as_view())

]