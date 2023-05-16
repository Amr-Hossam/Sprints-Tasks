from django.urls import path
from . import views

urlpatterns = [
	path('welcome/',views.welcome,name='welcome'),	
	path('list/',views.list_view,name='list'),	
	path('home/',views.home_view,name='home'),
	path('home2/',views.home_view2,name='home2'),

]