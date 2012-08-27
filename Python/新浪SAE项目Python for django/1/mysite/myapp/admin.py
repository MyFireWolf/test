from django.contrib import admin
from mysite.myapp.models import Users,Publisher,Author,Book

admin.site.register(Users)
admin.site.register(Publisher)
admin.site.register(Author)
admin.site.register(Book)