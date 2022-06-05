from django.db import models


# Create your models here.
class Course(models.Model):
    description = models.CharField(max_length=20)

    def __str__(self):
        return self.description


class Customer(models.Model):
    first_name = models.CharField(max_length=30)
    courses = models.ManyToManyField(Course, blank=True)

    def __str__(self):
        return (self.first_name)

    @property
    def upperName(self):
        return '%s' % (self.first_name + ' is cool')
