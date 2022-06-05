from django.db import models

class States(models.Model):
    abbrev = models.CharField(max_length=2)
    state_name = models.CharField(max_length=20)

    def __str__(self):
        return (self.state_name)

class Orders(models.Model):
    description = models.CharField(max_length=20)
    cost = models.DecimalField(max_digits=8, decimal_places=2)
    order_date = models.DateTimeField()

    def __str__(self):
        return (self.id)

# Create your models here.
class Customer(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    city = models.CharField(max_length=30)
    state_id = models.OneToOneField(States, models.CASCADE)
    zipcode = models.CharField(max_length=9)
    phone = models.CharField(max_length=10, null=True)
    customer_orders = models.ManyToManyField(Orders)

    def __str__(self):
        return (self.last_name + ", " + self.first_name)



