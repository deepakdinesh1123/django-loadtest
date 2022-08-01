from django.contrib import admin
from .models import AuthorGroup, AuthorDetail, Author

admin.site.register(AuthorGroup)
admin.site.register(Author)
admin.site.register(AuthorDetail)
