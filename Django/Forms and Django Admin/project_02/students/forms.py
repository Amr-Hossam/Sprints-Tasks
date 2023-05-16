from django import forms
from .models import Student
# from .models import StudentModel



# creating a form
class InputForm(forms.Form):
	ﬁrst_name = forms.CharField(max_length = 200)
	last_name = forms.CharField(max_length = 200)
	roll_number = forms.IntegerField(
		help_text = "Enter 6 digit roll number"
		)
	password = forms.CharField(widget = forms.PasswordInput())


# create a ModelForm
class StudentForm(forms.ModelForm):
	# specify the name of model to use
	class Meta:
		model = Student
		ﬁelds = "__all__"
	def home_view(request):
		form = StudentForm(request.POST or None)
		if form.is_valid():
			form.save()
			# save the form data to model
			context ={}
			context['StudentForm']=StudentForm()
		return render(request,"home2.html",context)
