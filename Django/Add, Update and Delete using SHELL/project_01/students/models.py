from django.db import models

# Create your models here.
class Student(models.Model):
	first_name = models.CharField(max_length=255)
	last_name = models.CharField(max_length=255)


class Course(models.Model):
	course_name = models.CharField(max_length=255)
	instructor_name = models.CharField(max_length=255)
