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

    def __str__(self):

        return f'Username: {self.username} ____Email: {self.email}'

class Shopping_address(models.Model):
    phone = models.CharField('phone',max_length=15 , default = '')
    receiver = models.CharField('receiver',max_length = 20,default = '')
    address_country = models.CharField('country',max_length = 20,default = '')
    address_detailed = models.CharField('address_detailed',max_length = 20,default = '')
    buyer = models.ForeignKey("User",on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.username}_{self.receiver}_{self.phone}'


class Commodity(models.Model):
    name = models.CharField('name',max_length = 50,default = '')
    manufacturer = models.CharField('manufacturer',max_length = 20,default='')
    amount = models.IntegerField('amout',default = 0)
    image = models.ImageField(null=True,)
    price = models.DecimalField('price',max_digits=12,decimal_places=2,default=88)
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

    def __str__(self):
        return f'{self.name}_{self.sales}_{self.manufacturer}'


class Order(models.Model):
    payment_amount = models.DecimalField('amount',max_digits=12,decimal_places=2,default = 0)
    payment_method = models.CharField('payment_method',max_length = 20,default = '')
    time = models.DateTimeField(auto_now_add=True)
    buyer = models.ForeignKey(User,on_delete=models.CASCADE)
    #commodities = models.ForeignKey(Commodity)

    def __str__(self):
        return f'{self.buyer.receiver}_{self.time}'

class Order_Commodities(models.Model):
    order = models.ForeignKey(Order,on_delete=models.CASCADE)
    amount = models.IntegerField('amount',default='1')
    commodity = models.ForeignKey(Commodity,on_delete=models.SET_NULL,null=True)


class Comment(models.Model):
    content = models.TextField('content',default = '')
    time = models.DateTimeField('time',auto_now_add=True)
    commentator = models.ForeignKey(User,on_delete=models.CASCADE,default='1')
    commodity_ID = models.ForeignKey(Commodity,on_delete=models.CASCADE)
   # score = models.DecimalField('discounting_rate',max_digits=15,decimal_places=10,default=1)
    def __str__(self):

        return f'{self.commodity_ID}_{self.content}'

class Cart(models.Model):
    quantity = models.IntegerField('quantity',default=0)
    commodity_id = models.ForeignKey(Commodity,on_delete=models.CASCADE)
    buyer_id = models.ForeignKey(User,on_delete=models.CASCADE)

class group_buying(models.Model):
    price = models.IntegerField('total_price',default=0)
    discounting_rate = models.DecimalField('discounting_rate',max_digits=15,decimal_places=10,default=1)
    participators = models.ManyToManyField(User)
    identity_token = models.CharField('address_detailed',max_length = 20,default = '')
    commodity_ID = models.ForeignKey(Commodity,on_delete=models.CASCADE)
    initiator = models.CharField('username',max_length = 20,default = '')

class sharing_discounting(models.Model):
    price = models.IntegerField('total_price',default=0)
    discounting_rate = models.DecimalField('discounting_rate',max_digits=15,decimal_places=10,default=1)
    helped_list = models.TextField(blank=True,null=True)
    commodity_ID = models.ForeignKey(Commodity,on_delete=models.CASCADE)
    initiator = models.ForeignKey(User,on_delete=models.CASCADE)
    identity_token = models.CharField('token',max_length = 20,default = '')

