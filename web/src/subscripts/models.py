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
class Options_Access(models.Model):
	# using the [ id = models.AutoField()]
	display = models.CharField(max_length=120, null=True)

	def __str__(self):
		return str(self.display)

class Options_Duration(models.Model):
	display = models.CharField(primary_key=True,max_length=120)
	calendar_days = models.IntegerField(
		blank=False,
		null=True,
		help_text='How Many Calendar Days Does The Subscription Run For?'
	)

	def __str__(self):
		return str(self.display)


class Options_User_Type(models.Model):
	display = models.CharField(primary_key=True,max_length=120)
	max_users = models.IntegerField(default=1)

	def __str__(self):
		return str(self.display)

class Options_Records(models.Model):
	display = models.CharField(primary_key=True,max_length=25)
	records = models.IntegerField(null=True)

	def __str__(self):
		return str(self.display)

class Options_Cost(models.Model):
	display = models.CharField(primary_key=True,max_length=120)
	cost = models.IntegerField(null=True)

	def __str__(self):
		return str(self.display)

class Options_Renewable(models.Model):
	display = models.CharField(primary_key=True,max_length=120)
	is_renewable = models.BooleanField(default=False)

	def __str__(self):
		return str(self.display)

class Options_Trial(models.Model):
	display = models.CharField(primary_key=True,max_length=120)
	is_trial = models.BooleanField(default=False)

	def __str__(self):
		return str(self.display)

class Options_Descript_Dur(models.Model):
	display = models.CharField(primary_key=True,max_length=120)

	def __str__(self):
		return str(self.display)

class Options_Descript_Type(models.Model):
	display = models.CharField(primary_key=True,max_length=120)

	def __str__(self):
		return str(self.display)

class subscriptions_type(models.Model):
	# using the [ id = models.AutoField()]
	assigned_name = models.CharField(max_length=100,null=True)
	Access = models.ForeignKey('Options_Access', on_delete=models.SET_NULL, null=True)
	Duration = models.ForeignKey('Options_Duration', on_delete=models.SET_NULL, null=True)	
	User_Type = models.ForeignKey('Options_User_Type', on_delete=models.SET_NULL, null=True)
	Records = models.ForeignKey('Options_Records', on_delete=models.SET_NULL, null=True)
	Cost = models.ForeignKey('Options_Cost', on_delete=models.SET_NULL, null=True)	
	Renewable = models.ForeignKey('Options_Renewable', on_delete=models.SET_NULL, null=True)	
	Trial = models.ForeignKey('Options_Trial', on_delete=models.SET_NULL, null=True)
	Description = models.TextField(null=True)
	Active = models.BooleanField(default=False)
	Testing = models.BooleanField(default=False)
	descript_dur = models.ForeignKey('Options_Descript_Dur', on_delete=models.SET_NULL, null=True)
	descript_type = models.ForeignKey('Options_Descript_Type', on_delete=models.SET_NULL, null=True)

	def __str__(self):
		return str(self.assigned_name)
