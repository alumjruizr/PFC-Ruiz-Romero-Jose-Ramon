from django.db import models

# Create your models here.

# Modelo de usuario
class User(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=25)
    password = models.CharField(max_length=20)
    registerDate = models.DateTimeField(blank=True, null=True)

    def registered(self):
        self.registerDate = timezone.now()
        self.save()

    def __str__(self):
        return self.username