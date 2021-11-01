from django.db import models

# Create your models here.

class Book(models.Model):
    title = models.CharField('name',max_length=20,default=None)
    pub = models.CharField('publisher',max_length=200,default='')
    price = models.DecimalField('price', max_digits= 5, default=None,decimal_places=2)
    info = models.CharField('info',max_length=100,default= None)

    class Meta:
        db_table = 'book'

class Author(models.Model):
    name = models.CharField(max_length = 15,default=None)
    age = models.IntegerField()
    email = models.EmailField()