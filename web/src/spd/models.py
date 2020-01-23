from django.db import models

# from .controllers import subscription_controller

"""
TODO:
	- membership login ?
	
DONE:
	- pharmacy table
		- should mimic structure from johns table
		- controller will handle delivering correct columns 
			- headers
			- data
	- subscription types 
		- should mimic structure from johns UI subscription type
		- controller will handle delivering correct columns 
			- headers
			- data


Note:
	Django adds:
		id = models.AutoField()
	by default to its tables/modelClasses

"""

## ---------------------------------------------------------------
## user configurable meta-data :: Access Types
class Subscription_Options_Access(models.Model):
	display = models.CharField(max_length=120, null=True)

	def __str__(self):
		return str(self.display)

class Subscription_Options_Duration(models.Model):
	display = models.CharField(max_length=120)
	calendar_days = models.IntegerField(
		blank=False,
		null=True,
		help_text='How Many Calendar Days Does The Subscription Run For?'
	)

	def __str__(self):
		return str(self.display)


class Subscription_Options_User_Type(models.Model):
	display = models.CharField(max_length=120)
	max_users = models.IntegerField(default=1)

	def __str__(self):
		return str(self.display)

class Subscription_Options_Records(models.Model):
	display = models.CharField(max_length=25,null=True)
	records = models.IntegerField(null=True)

	def __str__(self):
		return str(self.display)

class Subscription_Options_Cost(models.Model):
	display = models.CharField(max_length=120)
	cost = models.IntegerField(null=True)

	def __str__(self):
		return str(self.display)

class Subscription_Options_Renewable(models.Model):
	display = models.CharField(max_length=120)
	is_renewable = models.BooleanField(default=False)

	def __str__(self):
		return str(self.display)

class Subscription_Options_Trial(models.Model):
	display = models.CharField(max_length=120)
	is_trial = models.BooleanField(default=False)

	def __str__(self):
		return str(self.display)

class test_subscription_type(models.Model):
	# using the [ id = models.AutoField()]
	Access = models.CharField(max_length=60)
	Duration = models.CharField(max_length=60)	
	User_Type = models.CharField(max_length=60)
	Records = models.CharField(max_length=60)
	Cost = models.CharField(max_length=60)	
	Renewable = models.CharField(max_length=60)	
	Trial = models.CharField(max_length=60)
	Description = models.TextField(null=True)

class test_fk_subscription_type(models.Model):
	# using the [ id = models.AutoField()]
	assigned_name = models.CharField(max_length=100,null=True)
	Access = models.ForeignKey('Subscription_Options_Access', on_delete=models.SET_NULL, null=True)
	Duration = models.ForeignKey('Subscription_Options_Duration', on_delete=models.SET_NULL, null=True)	
	User_Type = models.ForeignKey('Subscription_Options_User_Type', on_delete=models.SET_NULL, null=True)
	Records = models.ForeignKey('Subscription_Options_Records', on_delete=models.SET_NULL, null=True)
	Cost = models.ForeignKey('Subscription_Options_Cost', on_delete=models.SET_NULL, null=True)	
	Renewable = models.ForeignKey('Subscription_Options_Renewable', on_delete=models.SET_NULL, null=True)	
	Trial = models.ForeignKey('Subscription_Options_Trial', on_delete=models.SET_NULL, null=True)
	Description = models.TextField(null=True)
	Active = models.BooleanField(default=False)
	Testing = models.BooleanField(default=False)

	def __str__(self):
		return str(self.assigned_name)

## ---------------------------------------------------------------
## user // subscriptions relations

# class subscription_users(models.Model):
# 	pass

class subscription_type(models.Model):
	# using the [ id = models.AutoField()]
	Access = models.CharField(max_length=60)	
	Duration = models.CharField(max_length=60)	
	User_Type = models.CharField(max_length=60)
	Records = models.CharField(max_length=60)
	Cost = models.CharField(max_length=60)	
	Renewable = models.CharField(max_length=60)
	Trial = models.CharField(max_length=60)

## ---------------------------------------------------------------
## pharmacy 
class pharmacies(models.Model):
	# using the [ id = models.AutoField()]
	Name = models.CharField(max_length=1200)	
	URL = models.URLField(max_length=4000)
	Street = models.CharField(max_length=3000)
	City = models.CharField(max_length=2000)	
	State = models.CharField(max_length=20)	
	State_full = models.CharField(max_length=500)
	# Zip = models.IntegerField()
	Zip = models.CharField(max_length=50)		
	# Phone = models.IntegerField()
	Phone = models.CharField(max_length=500)
	Conditions = models.CharField(max_length=1000)
	Contact = models.CharField(max_length=6000)
	Company_Type = models.CharField(max_length=2000)
	Contact_Email = models.CharField(max_length=6000)
	Accreditation = models.CharField(max_length=6000)	
	Owner_Independent = models.CharField(max_length=6000)	
	Patient_Services = models.CharField(max_length=6000)	
	Payer_Services = models.CharField(max_length=6000)	
	Pharma_Services	= models.CharField(max_length=6000)
	Locations = models.CharField(max_length=6000)	
	Limted_Distribution_Drugs = models.CharField(max_length=6000)

	def __str__(self):
		return str(self.Name)





















