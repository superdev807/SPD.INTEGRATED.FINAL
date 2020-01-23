# from django.shortcuts import render

import sys, json, pdb, pprint

# import pprint
# import collections
# import pydash as p_
# import requests as http

# from django.shortcu:qts import render
from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse

from rest_framework import permissions
from rest_framework.decorators import action, list_route, permission_classes
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet as _vw

from users.models import User
from spd.models import (
	test_fk_subscription_type, Subscription_Options_Access, Subscription_Options_Duration,
	Subscription_Options_User_Type, Subscription_Options_Records, Subscription_Options_Cost, 
	Subscription_Options_Renewable, Subscription_Options_Trial,

	pharmacies
)
from utils.responses import json_prep

pp = pprint.PrettyPrinter(indent=4)

class SubscriptionViewSet(_vw):
	@list_route(methods=['GET'])
	def types(self, request):
		_success_message = {'status': 'success'}
		_error_message = {'status': 'fail'}
		_find = ['email', 'password', 'first', 'last']

		DROP = ['id']
		ATTRS = { item.attname:None for item in test_fk_subscription_type._meta.get_fields() }
		for field in DROP:
			del ATTRS[field]
		fields = [str(attr) for attr in ATTRS]

		def map_subscriptions(row_dict):
			# return {
			# 	'Access': None,
			# 	'Duration': None,
			# 	'User_Type': None,
			# 	'Records': None,
			# 	'Cost': None,
			# 	'Renewable': None,
			# 	'Trial': None,
			# 	'Description': None,
			# 	'Active': None,
			# 	'Testing': None
			# }
			return {
				'Access': Subscription_Options_Access.objects.get(id=row_dict['Access_id']),
				# 'Duration': Subscription_Options_Duration.objects.get(id=row_dict['Duration_id']),
				'User_Type': Subscription_Options_User_Type.objects.get(id=row_dict['User_Type_id']),
				'Records': Subscription_Options_Records.objects.get(id=row_dict['Access_id']),
				'Cost': Subscription_Options_Cost.objects.get(id=row_dict['Cost_id']),
				'Renewable': Subscription_Options_Renewable.objects.get(id=row_dict['Renewable_id']),
				'Trial': Subscription_Options_Trial.objects.get(id=row_dict['Trial_id']),
				'Description': row_dict['Description'],
				'Active': row_dict['Active'],
				'Testing': row_dict['Testing']
			}
		# _success_message['data'] = list(test_fk_subscription_type.objects.values(*fields))
		# _success_message['data'] = list(test_fk_subscription_type.objects.values(*fields)) 
		_success_message['data'] = [ map_subscriptions(i) for i in list(test_fk_subscription_type.objects.values(*fields)) ]

		pdb.set_trace()
		return Response(_success_message, status=200)
		# return JsonResponse(_success_message, status=200)
		

"""
-- Stashing 
______________________________________
drop = ['id']
fields = test_fk_subscription_type._meta.get_fields()
fields.remove(drop)
______________________________________
return JsonResponse(_success_message, status=200)

"""