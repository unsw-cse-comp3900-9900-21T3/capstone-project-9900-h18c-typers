from django.contrib import admin
from django.urls import path,re_path,include
from . import views

urlpatterns = [
    path('login', views.login_view),
    path('register',views.register_view),
    path('logout',views.logout)
]
