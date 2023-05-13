from django.urls import path
from . import views

urlpatterns = [
	path('welcome/',views.welcome,name='welcome'),	
	path('list/',views.list_view,name='list'),	

]