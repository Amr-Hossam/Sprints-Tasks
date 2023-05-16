from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader
from .models import Student
from .forms import InputForm,StudentForm


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


# Create your views here.
def home_view(request):
	context ={}
	context['form']= InputForm()
	return render(request, "home.html", context)

def home_view2(request):
	form = StudentForm(request.POST or None)
	if form.is_valid():
		form.save()
	 # save the form data to model
	
	context ={}
	context['StudentForm']=StudentForm()
	return render(request,"home2.html",context)
