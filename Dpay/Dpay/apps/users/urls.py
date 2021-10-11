from django.urls import path
from . import views
import re

urlpatterns = [
    path('register/', views.RegisterView.as_view()),
    path(r'usernames/<username>/count/', views.CheckUsernameView.as_view()),
    path(r'mobiles/<int:mobile>/count/', views.CheckMobileView.as_view())
]