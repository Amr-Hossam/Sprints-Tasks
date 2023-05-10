from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

# Create your views here.

def welcome(request):
	return HttpResponse("Hello Eng.Aya")

def cv(request):
	return render(request,"cv.html")