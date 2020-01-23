	# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import pdb

from django.contrib import admin

from subscripts.models import (
	Options_Access, Options_Duration, Options_User_Type,
	Options_Records, Options_Cost, Options_Renewable,
	Options_Trial, subscriptions_type,
	Options_Descript_Dur,
	Options_Descript_Type

)

class admin__subscription_type(admin.ModelAdmin):
	list_display = [field.name for field in subscriptions_type._meta.get_fields()]
	
# admin.site.register(subscriptions_type)
admin.site.register(subscriptions_type, admin__subscription_type)

admin.site.register(Options_Access) 
# admin.site.register(admin__Options_Access, Options_Access) 

admin.site.register(Options_Duration)
# admin.site.register(admin__Options_Duration, Options_Duration) 

admin.site.register(Options_User_Type)
# admin.site.register(admin__Options_User_Type, Options_User_Type)

admin.site.register(Options_Records)
# admin.site.register(admin__Options_Records, Options_Records)

admin.site.register(Options_Cost)
# admin.site.register(admin__Options_Cost, Options_Cost)

admin.site.register(Options_Renewable)
# admin.site.register(admin__Options_Renewable, Options_Renewable)

admin.site.register(Options_Trial)
# admin.site.register(admin__Options_Trial, Options_Trial)

admin.site.register(Options_Descript_Dur)
# admin.site.register(admin__Options_Trial, Options_Trial)

admin.site.register(Options_Descript_Type)
# admin.site.register(admin__Options_Trial, Options_Trial)
