from django.db import models


class AuthorGroup(models.Model):
    name = models.CharField(max_length=10, unique=True)
    size = models.IntegerField()


class Author(models.Model):
    name = models.CharField(max_length=10, unique=True)
    group = models.ForeignKey(
        AuthorGroup, on_delete=models.DO_NOTHING, to_field="name", related_name="name+"
    )


class AuthorDetail(models.Model):
    user_name = models.ForeignKey(
        Author, on_delete=models.CASCADE, to_field="name", related_name="name+"
    )
    age = models.IntegerField()
    address = models.TextField()
