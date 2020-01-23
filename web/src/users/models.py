# from django.db import models

"""
TODO:
	- users table
		- controller will handle delivering correct columns 
			- data
	- billing_info 
		- controller will handle delivering correct columns 
			- data


Note:
	Django adds:
		id = models.AutoField()
	by default to its tables/modelClasses

"""

# class users(models.Model):
# 	First_Name = models.CharField(max_length=60) 
# 	Last_Name = models.CharField(max_length=60)
# 	Email = models.CharField(max_length=60, primary_key=True)
# 	User_Name = models.CharField(max_length=60, unqiue=True)
# 	Password = models.CharField(max_length=60)
# 	Company_Name = models.CharField(max_length=60, null=True)
# 	Job_Title = models.CharField(max_length=60, null=True)
# 	Years_Exper = models.CharField(max_length=60, null=True)

# class billing_info(models.Model):
# 	Street = models.CharField(max_length=60)
# 	City = models.CharField(max_length=60)
# 	State = models.CharField(max_length=60)
# 	ZIP = models.CharField(max_length=60)



from django.db import models

"""
Note:
	Django adds:
		id = models.AutoField()
	by default to its tables/modelClasses

"""

class User(models.Model):
	email = models.CharField(max_length=60, primary_key=True)
	password = models.CharField(max_length=60)
	first_name = models.CharField(max_length=60)
	last_name = models.CharField(max_length=60)
	org_name = models.CharField(max_length=60, null=True)
	org_type = models.CharField(max_length=60, null=True)
	org_age = models.CharField(max_length=60, null=True)
	org_location = models.CharField(max_length=60, null=True)
	org_leadership_ethnicity = models.CharField(max_length=60, null=True)