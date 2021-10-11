from django.contrib.auth.models import AbstractUser
from django.db import models

# Create your models here.
class User(AbstractUser):
    mobile = models.CharField(verbose_name="Phone Number",max_length=11,unique=True)
    class Meta:
        db_table = "table_users"