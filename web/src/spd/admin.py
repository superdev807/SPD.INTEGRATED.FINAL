
## -----------------------------------
## import spd tables
from spd.models import test_subscription_type, subscription_type, pharmacies

## -----------------------------------
## import user definiable tables
from spd.models import (
	Subscription_Options_Access, Subscription_Options_Duration, Subscription_Options_User_Type,
	Subscription_Options_Records, Subscription_Options_Cost, Subscription_Options_Renewable,
	Subscription_Options_Trial
)

## -----------------------------------
## fk test
from spd.models import test_fk_subscription_type
	

from django.contrib import admin

class admin__pharmacies(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

# admin__subscription_type


class admin__test_subscription_type(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__Subscription_Options_Access(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__Subscription_Options_Duration(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__Subscription_Options_User_Type(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__Subscription_Options_Records(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__Subscription_Options_Cost(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__Subscription_Options_Renewable(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__Subscription_Options_Trial(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]

class admin__test_fk_subscription_type(admin.ModelAdmin):
	DROP = ['id']
	ATTRS = { item.attname:None for item in pharmacies._meta.get_fields() }
	for field in DROP:
		del ATTRS[field]
	list_display = [str(attr) for attr in ATTRS]




## -----------------------------------
## -- REGISTER spd tables

admin.site.register(test_subscription_type)
# admin.site.register(admin__test_subscription_type, test_subscription_type)


admin.site.register(subscription_type)
# admin.site.register(admin__subscription_type, subscription_type)

# admin.site.register(pharmacies)
admin.site.register(pharmacies, admin__pharmacies)


## -----------------------------------
## -- REGISTER user definiable tables

admin.site.register(Subscription_Options_Access) 
# admin.site.register(admin__Subscription_Options_Access, Subscription_Options_Access) 

admin.site.register(Subscription_Options_Duration)
# admin.site.register(admin__Subscription_Options_Duration, Subscription_Options_Duration) 

admin.site.register(Subscription_Options_User_Type)
# admin.site.register(admin__Subscription_Options_User_Type, Subscription_Options_User_Type)

admin.site.register(Subscription_Options_Records)
# admin.site.register(admin__Subscription_Options_Records, Subscription_Options_Records)

admin.site.register(Subscription_Options_Cost)
# admin.site.register(admin__Subscription_Options_Cost, Subscription_Options_Cost)

admin.site.register(Subscription_Options_Renewable)
# admin.site.register(admin__Subscription_Options_Renewable, Subscription_Options_Renewable)

admin.site.register(Subscription_Options_Trial)
# admin.site.register(admin__Subscription_Options_Trial, Subscription_Options_Trial)


## -----------------------------------
## fk test
admin.site.register(test_fk_subscription_type)
# admin.site.register(admin__test_fk_subscription_type, test_fk_subscription_type)

