from django.urls import path
from . import views

urlpatterns = [
	path('welcome/',views.welcome,name='welcome'),	
	path('cv/',views.cv,name='cv')
]