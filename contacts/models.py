from django.db import models


# Create your models here.
class Person(models.Model):
    name = models.CharField(max_length=64)
    surname = models.CharField(max_length=64)
    description = models.TextField()
    picture = models.ImageField(null=True)
    address = models.ForeignKey('Address', on_delete=models.SET_NULL, null=True)


class Address(models.Model):
    city = models.CharField(max_length=64)
    street_name = models.CharField(max_length=64)
    house_number = models.CharField(max_length=6)
    flat_number = models.CharField(max_length=6, null=True)


class Phone(models.Model):
    phone_number = models.BigIntegerField()
    PHONE_TYPES = (
        (1, "work"),
        (2, "home"),
        (3, "private")
    )
    phone_type = models.IntegerField(choices=PHONE_TYPES)
    person = models.ForeignKey(Person, on_delete=models.CASCADE)


class Email(models.Model):
    email = models.CharField(max_length=64)
    EMAIL_TYPES = (
        (1, "work"),
        (2, "home"),
        (3, "private")
    )
    email_type = models.IntegerField(choices=EMAIL_TYPES)
    person = models.ForeignKey(Person, on_delete=models.CASCADE)


class Groups(models.Model):
    name = models.CharField(max_length=64)
    person = models.ManyToManyField(Person)
