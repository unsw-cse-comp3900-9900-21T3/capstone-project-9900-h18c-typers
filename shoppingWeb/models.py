from django.db import models

# Create your models here.
from django.db import models

# Create your models here.
class User(models.Model):
    password = models.CharField(max_length=33,default='')
    birth= models.DateField('birth',auto_now=False,default='')
    name = models.CharField('name',max_length= 20,default = '')
    username = models.CharField('username',max_length=20,default='')
    gender_choices = (
        (0,'female'),
        (1, 'male'),
        (2, 'secrecy')
    )
    gender = models.SmallIntegerField(choices=gender_choices)
    email = models.EmailField()
    create_time = models.DateField(auto_now_add=True)

class Shopping_address(models.Model):
    phone = models.CharField('phone',max_length=15 , default = '')
    receiver = models.CharField('receiver',max_length = 20,default = '')
    address_country = models.CharField('country',max_length = 20,default = '')
    address_detailed = models.CharField('address_detailed',max_length = 20,default = '')
    buyer = models.ForeignKey("User",on_delete=models.CASCADE)


class Order(models.Model):
    payment_amount = models.DecimalField('amount',max_digits=12,decimal_places=2,default = 0)
    payment_method = models.CharField('payment_method',max_length = 20,default = '')
    time = models.DateTimeField(auto_now_add=True)
    buyer = models.ForeignKey(Shopping_address,on_delete=models.CASCADE)
    commodities = models.ManyToManyField("Commodity")


class Commodity(models.Model):
    name = models.CharField('name',max_length = 20,default = '')
    manufacturer = models.CharField('manufacturer',max_length = 20,default='')
    amount = models.IntegerField('amout',default = 0)
    image = models.ImageField(null=True)
    category_choices = (
        (0, 'digital'),
        (1, 'carton'),
        (2, 'foods'),
        (3, 'cosmetics'),
        (4, 'clothes'),
        (5, 'pet_supplies'),
        (6, 'baby_product'),
        (7, 'other')

    )
    category = models.SmallIntegerField('category', choices=category_choices, default= 7)
    sales = models.DecimalField('sales',max_digits=12,decimal_places=2,default=0)

class Comment(models.Model):
    content = models.TextField('content',default = '')
    time = models.DateTimeField('time',auto_now_add=True)
    #commentator = models.(User)
    commodity_ID = models.ForeignKey(Commodity,on_delete=models.CASCADE)

class Cart(models.Model):
    quantity = models.IntegerField('quantity',default=0)
    commodity_id = models.ForeignKey(Commodity,on_delete=models.CASCADE)
    buyer_id = models.ForeignKey(User,on_delete=models.CASCADE)

class group_buying(models.Model):
    total = models.IntegerField('total_price',default=0)
    discount = models.FloatField('discount',default=0)
    participators = models.ManyToManyField(User)
    commodity_ID = models.ForeignKey(Commodity,on_delete=models.CASCADE)

class sharing_discounting(models.Model):
    discounting_rate = models.DecimalField('discounting_rate',max_digits=5,decimal_places=2,default=1)
    helped_list = models.TextField(blank=True,null=True)
    commodity_ID = models.ForeignKey(Commodity,on_delete=models.CASCADE)
    initiator = models.ForeignKey(User,on_delete=models.CASCADE)

