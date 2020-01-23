# from django.shortcuts import render

import sys
import json
# import pprint
# import collections
# import pydash as p_
# import requests as http

# from django.shortcu:qts import render
from django.core.exceptions import ObjectDoesNotExist

from rest_framework import permissions
from rest_framework.decorators import action, list_route, permission_classes
from rest_framework.response import Response
from rest_framework.viewsets import ViewSet as _vw

from users.models import User

# memberships // transactions !

class MembershipViewSet(_vw):
	pass

class UserViewSet(_vw):
	@list_route(methods=['POST'])
	def _create(self, request):
		
		_success_message = {'status': 'success'}
		_error_message = {'status': 'fail'}
		_find = ['email', 'password', 'first', 'last']

		if all(key in request.data.keys() for key in _find):
			try:
				_ = User.objects.get(email=request.data['email'])
				_error_message['message'] = 'This Email Address Is Already Registered'
				return Response(_error_message, status=500)
		
			except ObjectDoesNotExist:
				_ = User.objects.create( 
					email=request.data['email'], 
					password=request.data['password'],
					first_name=request.data['first'],
					last_name=request.data['last'])
				_success_message['message'] = 'User Created'
				return Response(_success_message, status=200)
		
			except:
				_error_message['_message'] = sys.exc_info()[0]
				_error_message['message'] = 'Error Occured In Creating This User'
				return Response(_error_message, status=500)
		
		else:
			_error_message['message'] = 'You Are Not Passing the Correct Request Body'
			_error_message['required_keys'] = _find
			return Response(_error_message, status=500)
	
	@list_route(methods=['POST'])
	def _login(self, request):
		
		_success_message = {'status': 'success'}
		_error_message = {'status': 'fail'}
		_find = ['email', 'password']
		
		if all(key in request.data.keys() for key in _find):
			try:
				_ = User.objects.get(email=request.data['email'])
		
				if _.password and _.password == request.data['password']:
					_success_message['logged_in'] = True
					return Response(_success_message, status=200)
		
				else:
					_error_message['logged_in'] = False
					_error_message['message'] = 'Incorrect Password'
					return Response(_error_message, status=200)
		
			except ObjectDoesNotExist:
				_error_message['message'] = 'That Is Not A User'
				_error_message['logged_in'] = False
				return Response(_error_message, status=500)
		
			except:
				_error_message['message'] = sys.exc_info()[0]
				return Response(_error_message, status=500)
		
		else:
			_error_message['message'] = 'You Are Not Passing the Correct Request Body'
			_error_message['required_keys'] = _find
			return Response(_error_message, status=500)

	@list_route(methods=['POST'])
	def _meta(self, request):
		
		_success_message = {'status': 'success'}
		_error_message = {'status': 'fail'}
		_find = ['type']
		
		if all(key in request.data.keys() for key in _find):
			if request.data['type'] == 'meta' and\
				len(request.data.keys()) == 1:
					_success_message['columns'] = [item.name for item in User._meta.get_fields()]
					return Response(_success_message, status=200)
			
			if request.data['type'] == 'user'\
				and request.data.get('email') is not None:
					try:
				
						_ = User.objects.get(email=request.data['email']).__dict__
						del _['_state'] 
						del _['password']
				
						_success_message['user_meta'] = _
						return Response(_success_message, status=200)
				
					except ObjectDoesNotExist:
						_error_message['no_user_for_email'] = request.data['email']
						return Response(_error_message, status=500)
				
					except:
						_error_message['message'] = sys.exc_info()[0]
						return Response(_error_message, status=500)
			
			else:
				_error_message['message'] = 'You Are Not Passing the Correct Request Body'
				_error_message['required_keys'] = ['type','email']
			return Response(_error_message, status=500)
		
		else:
			_error_message['message'] = 'You Are Not Passing the Correct Request Body'
			_error_message['required_keys'] = _find
			return Response(_error_message, status=500)

	@list_route(methods=['POST'])
	def _update(self, request):
		
		_success_message = {'status': 'success'}
		_error_message = {'status': 'fail'}
		_find = ['email', 'password', 'first_name', 'last_name']
		_find_newp = _find + ['new-password']

		if 'update-password' in request.data.keys():
			if all(key in request.data.keys() for key in _find_newp):
				if request.data['new-password'] == request.data['update-password']:
					try:
						_ = User.objects.get(email=request.data['email'])
						if _.password == request.data['password']:

							_updated = User.objects.filter(
								email=request.data['email']
							).update(password=request.data['new-password'])
							
							if _updated == 1:
								_success_message['message'] = 'Updated User Password'
								return Response(_success_message, status=200)
							
							else:
								_error_message['message'] = 'User Password NOT Updated'
								return Response(_error_message, status=500)
						else:
							_error_message['message'] = 'Incorrect Password'
							return Response(_error_message, status=500)

					except ObjectDoesNotExist:
						_error_message['no_user_for_email'] = request.data['email']
						return Response(_error_message, status=500)
					
					except:
						_error_message['message'] = sys.exc_info()[0]
						return Response(_error_message, status=500)
				
				else:
					_error_message['message'] = '[update-password] must == [new-password]'
					return Response(_error_message, status=500)
			
			else:
				 _find_newp = _find_newp + ['update-password']
				 _error_message['required_keys'] = _find_newp
				 return Response(_error_message, status=500)

		if all(key in request.data.keys() for key in _find_newp) and\
			'update-password' not in request.data.keys():
				_find_newp = _find_newp + ['update-password']
				_error_message['required_keys'] = _find_newp
				return Response(_error_message, status=500)

		elif all(key in request.data.keys() for key in _find):
			try:
				_ = User.objects.get(email=request.data['email'])
				if _.password == request.data['password']:
					
					_email = request.data['email']
					del request.data['email']
					del request.data['password']
					
					_updated = User.objects.filter(email=_email).update(**request.data)
					
					if _updated == 1:
						_success_message['message'] = 'User Data Updated'
						return Response(_success_message, status=200)
					
					else:
						_error_message['message'] = 'User Data NOT Updated'
						return Response(_error_message, status=500)
				
				else:
					_error_message['message'] = 'Incorrect Password'
					return Response(_error_message, status=500)
			
			except ObjectDoesNotExist:
				_error_message['no_user_for_email'] = request.data['email']
				return Response(_error_message, status=500)
			
			except:
				_error_message['message'] = sys.exc_info()[0]
				return Response(_error_message, status=500)
		
		else:
			_error_message['message'] = 'You Are Not Passing the Correct Request Body'
			_error_message['required_keys'] = {
				'update': _find,
				'update-password': _find_newp
			}
			return Response(_error_message, status=500)
