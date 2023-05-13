from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from .models import Student

# Create your views here.

def welcome(request):
	return HttpResponse("Welcome to out site")


def list_view(request):
	# dictionary for initial data with
	# ﬁeld names as keys
	context ={}
	# add the dictionary during initialization
	context["dataset"] = Student.objects.all()
	return render(request, "list_view.html", context)

