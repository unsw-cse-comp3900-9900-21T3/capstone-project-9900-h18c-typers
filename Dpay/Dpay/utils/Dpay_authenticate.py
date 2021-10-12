from django.contrib.auth.backends import ModelBackend
import re
from users.models import User


class Dpay_ModelBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):


        try:
            if re.match(r'^1[3-9]\d{9}$', username):
                user = User.objects.get(mobile=username)
            else:
                user = User.objects.get(username=username)
        except Exception as e:
            return None

        if user.check_password(password):
            return user
        else:
            return None