from django.contrib import admin
from .models import Author, AuthorDetail, AuthorGroup

# Register your models here.
admin.site.register(AuthorGroup)
admin.site.register(Author)
admin.site.register(AuthorDetail)
