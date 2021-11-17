from django.contrib import admin

# Register your models here.
from .models import *
admin.site.register(Shopping_address)
admin.site.register(User)
admin.site.register(Order)
admin.site.register(Commodity)
admin.site.register(Comment)
admin.site.register(Cart)
admin.site.register(group_buying)
admin.site.register(sharing_discounting)