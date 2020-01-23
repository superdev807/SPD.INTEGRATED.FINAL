import sys, copy, os, pprint, pdb, uuid
from copy import copy, deepcopy
from datetime import datetime

from utils.responses import SUCCESS, ERROR, INCORRECT_KEYS, required_keys, drop_underscore
from utils.requests import validate_body, validate_shape
# from lib.domain_auth import auth_resp, membership, user

from lib.domain_auth import auth_resp as authorize_resp
from lib.domain_auth import user as spd_user
from lib.domain_auth import membership as spd_membership

from lib.domain_auth import controller_user
from lib.domain_auth import controller_membership

from flask import Blueprint, Response, request, abort, jsonify
from pymongo import MongoClient

# -----------------------------
client = MongoClient('mongodb://localhost:27017/')

# -----------------------------
_auth = Blueprint('auth', __name__)

# -----------------------------
@_auth.route('/login', methods=['POST'])
def _login():
	try:
		resp = copy(SUCCESS)
		body = request.get_json()
		body_keys = body.keys()

		MUST = [ 'Email', 'Password' ]
		
		if 'first-time-group' in body and body['first-time-group']:
			if 'Group_Password' not in body and 'Group_Name' not in body:
				resp = copy(ERROR)
				resp['message'] = 'Users First Log In To Group - Need Group_Password and Group_name'
				resp['keys'] = [ 'Group_Name', 'Group_Password' ]
				return jsonify(resp), 500
			
			else:
				user_controller = controller_user()
				logged_in, user, email = user_controller.loggin_first_access_group(
					body['Email'], body['Password'], body['Group_Name'], body['Group_Password']
				)
				
				if logged_in:
					records, access = user_controller.get_view_meta( body['Email'] )
					resp['records'] = records
					resp['access'] = access
					resp['email'] = body['Email']
					resp['logged_in'] = True
					
					pdb.set_trace()
					return jsonify(resp), 200
				
				else:
					resp['email'] = body['Email']
					resp['logged_in'] = False
					return jsonify(resp), 500

		elif all( item in MUST for item in body_keys):

			user_controller = controller_user()
			memb_controller = controller_membership()

			user = user_controller.get_user_info_by_email( body['Email'] )
			if len(user) == 1:
				user = user[0]
				if user['belongs_group'] and user['first_access']:
					resp = copy(ERROR)
					resp['message'] = ' Need First Time Group Login !'
					resp['additional_key'] = [ 'first-time-group', 'Group_Password', 'Group_Name' ]
					resp['logged_in'] = False
					return jsonify(resp), 500

				# elif not memb_controller.is_current( memb_id ):
				# 	resp['message'] = ' Your Membership is Not Current !'
				# 	resp['logged_in'] = False
				# 	return jsonify(resp), 500

				else:
					if body['Password'] == user['Password']:

						user_controller = controller_user()
						logged_in, email = user_controller.loggin( body['Email'] )
						if logged_in:
							records, access = user_controller.get_view_meta( body['Email'] )
							resp['records'] = records
							resp['access'] = access
							resp['email'] = email
							resp['logged_in'] = True

							pdb.set_trace()
							return jsonify(resp), 200
						
						else:
							resp['email'] = email
							resp['logged_in'] = False
							return jsonify(resp), 500 
					else:
						resp = copy(ERROR)
						resp['message'] = 'That Password is Incorrect'
						resp['logged_in'] = False
						return jsonify(resp), 500
			else:
				resp = copy(ERROR)
				resp['message'] = 'That Email Address Does Not Exist'
				resp['logged_in'] = False
				return jsonify(resp), 500
		
		else:
			resp = copy(ERROR)
			resp['message'] = 'Required Body Keys :'
			resp['keys'] = MUST	
			return jsonify(resp), 500
	
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500

@_auth.route('/modify', methods=['POST'])
def _modify():
	try:
		resp = copy(SUCCESS)
		body = request.get_json()
		
		# TO-DO :: re write to take any arguement
		if body['what']=='user' and body['email'] != '' and body['new_email'] != '':
			user = list(mongo_client.local_spd.user.find({ 'Email': body['email'] }))
			
			if len(user) > 0 :
				update_user = mongo_client.local_spd.update(
					{'Email': body['email'] },
					{'Email': body['new_email'] }
				)
				resp['message'] = 'Email Address Modified'
				resp['no_user_email'] = body['email']
				return jsonify(resp), 500
			else:
				resp = copy(ERROR)
				resp['message'] = 'That User Does Not Exist'
				resp['no_user_email'] = body['email']
				return jsonify(resp), 500
		else:
			resp = copy(ERROR)
			resp['accepted_what'] = ['user']
			return jsonify(resp), 500
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500


@_auth.route('/create', methods=['POST'])
def create():
	try:
		resp = copy(SUCCESS)
		body = request.get_json()
		body_keys = body.keys()

		MUST = [ 'sub_id', 'pg_id', 'hash', 'trans_id', 'auth_id']
		if all( key in body_keys for key in MUST):

			if body['type']=='multi' and 'admin_user' in body.keys() and 'users' in body.keys():
				for user in body['users']:
					user_controller = controller_user()
					passes, message, email = user_controller.check_user_obj( user['Email'], user['Password'])

					if passes:
						continue
					else:	
						resp = copy(ERROR)
						resp['message'] = message
						resp['failed_user'] = email
						return jsonify(resp), 500

				passes_admin, message, email = user_controller.check_user_obj( body['admin_user']['Email'], body['admin_user']['Password'] )
				if passes_admin:

					memb_controller = controller_membership()
					passess_memb, message, email = memb_controller.check_memb_obj( body['group_name'], body['group_password'] )
					if passess_memb:

						memb_created_id = None
						admin_id = None
						user_ids = []

						try:
							params = {
								'hash': body['hash'],
								'trans_id': body['trans_id'],
								'auth_id': body['auth_id'],
								'sub_id': body['sub_id'],
							    'pg_id': body['pg_id'],
							    'group_name': body['group_name'],
							    'group_password': body['group_password'] 
						    }
							created, member_id = memb_controller.create(params)
							if created:
								memb_created_id = member_id
							
							else:
								resp = copy(ERROR)
								resp['message'] = 'Failed in Creating !'
								resp['failed'] = {
									'group_name': body['group_name'],
									'group_password': body['group_password']
								}
								memb_controller.delete_one( memb_created_id )
								return jsonify(resp), 500

						except:
							resp = copy(ERROR)
							resp['message'] = 'FROM EXCEPT(N'
							resp['error+message'] = sys.exc_info()[0]
							resp['failed'] = {
								'group_name': body['group_name'],
								'group_password': body['group_password']
							}
							memb_controller.delete_one( memb_created_id )
							return jsonify(resp), 500

						try:
							to_write = body['admin_user']
							to_write['membership'] = memb_created_id
							to_write['belongs_group'] = True
							to_write['Group_Name'] = body['group_name']
							to_write['Group_Password'] = body['group_password'] 

							user_controller = controller_user()
							admin = user_controller.create_group_admin_user( to_write )
							## TO DO :: CLEAN UP
							admin_id = admin[1]

						# if error in admin user write, 500
						except:
							resp = copy(ERROR)
							resp['message'] = 'User Email Already Exists'
							resp['failed'] = body['admin_user']

							user_controller = controller_user()
							user_controller.delete_one( admin_id )
							return jsonify(resp), 500

						# create regular users
						try:
							for user in body['users']:
								user['membership'] = memb_created_id
								user['belongs_group'] = True
								user['Group_Name'] = body['group_name']
								user['Group_Password'] = body['group_password'] 

								user_controller = controller_user()
								created_user_id = user_controller.create_user( user )
								## TO DO :: CLEAN THIS UP
								user_ids.append( created_user_id[1] )

						# if error increating individual users, 500
						except:
							resp = copy(ERROR)
							resp['message'] = ' Could Create Users, Please ReTry'

							user_controller = controller_user()
							user_controller.delete_many( user_ids )
							return jsonify(resp), 500

						memb_controller = controller_membership()
						memb_controller.associate( memb_created_id, admin_id, user_ids )
						return jsonify(resp), 200
					
					# if does not pass membership_check, 500
					else:
						resp = copy(ERROR)
						resp['message'] = message
						resp['failed_membership'] = email

						memb_controller = controller_membership()
						memb_controller.delete_one( memb_created_id )
						return jsonify(resp), 500
				
				# if does not pass admin_user check, 500
				else:
					resp = copy(ERROR)
					resp['message'] = message
					resp['failed_user'] = email

					user_controller = controller_user()
					user_controller.delete_one( admin_id )
					return jsonify(resp), 500
			
			# -- Done
			elif body['type']=='single':

				user_controller = controller_user()
				passess, message, email = user_controller.check_user_obj( body['user']['Email'], body['user']['Password'])

				if passess:
					try:
						memb_created_id = None
						user_id = None

						memb_params = {
							'hash': body['hash'],
							'trans_id': body['trans_id'],
							'auth_id': body['auth_id'],
							'sub_id': body['sub_id'],
						    'pg_id': body['pg_id'],
						    'group_name': body['user']['Email'],
						    'group_password': body['user']['Password']
						}
						
						memb_controller = controller_membership()
						created, member_id = memb_controller.create( memb_params )

						if created:
							memb_created_id = member_id
						
						else:
							resp = copy(ERROR)
							resp['message'] = 'Group Name Or Password Already Exists. Need Unique Both'
							resp['failed'] = {
								'group_name': body['group_name'],
								'group_password': body['group_password']
							}
							memb_controller.delete_one( memb_created_id )
							return jsonify(resp), 500

						try:
							params = body['user']
							params['membership'] = memb_created_id
							params['belongs_group'] = False
							params['Group_Name'] = body['user']['Email']
							params['Group_Password'] = body['user']['Password']

							user_controller = controller_user()
							created_user_id = user_controller.create_user( params )
						
						except: 
							resp = copy(ERROR)
							resp['message'] = ['That User Email Already Exists']
							user_controller.delete_one( user_id )
							return jsonify(resp), 500

						memb_controller = controller_membership()
						memb_controller.associate( memb_created_id, None, None )
						
						return jsonify(resp), 200
					
					except:
						resp = copy(ERROR)
						resp['message'] = ['That Membership Namme Already Exists']
						return jsonify(resp), 500

				else:
					resp = copy(ERROR)
					resp['message'] = ['Every User Needs A Unique Email And Unique Password']
					resp['failed_user'] = body['user']
					return jsonify(resp), 500
			
			else:
				resp = copy(ERROR)
				resp['accepted_types'] = {
					'type': ['single', 'multi'], 
					'user': ['user', 'admin_user']
				}
				return jsonify(resp), 500

		else:
			resp = copy(ERROR)
			resp['message'] = 'Body is Missing Keys'
			resp['keys'] = MUST
			return jsonify(resp), 500
	
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500



# _______________________________________________________________
# _______________________________________________________________
# @_auth.route('/create', methods=['POST']) 
# def _create():
# 	try:
# 		# -----------------------------
# 		def check_memb_obj(obj):
			
# 			# Checks That: 
# 			# 	- group name does not exist OR is not blank
# 			# 	- group pswd does not exist OR is not blank
			
# 			message = 'Need A Unique Group Name And Password'
# 			memb = spd_membership()
			
# 			group = list(mongo_client.local_spd[memb.__class__.__name__].find({'name':obj['group_name']}))
# 			pswd = list(mongo_client.local_spd[memb.__class__.__name__].find({'password':obj['group_password']}))

# 			if len(group) > 0:
# 				message = 'This group name exists already'
# 				return False, message, {'group_name': obj['group_name'], 'group_password': obj['group_password']}
			
# 			if len(pswd) > 0:
# 				message = 'This group Password exists already'
# 				return False, message, {'group_name': obj['group_name'], 'group_password': obj['group_password']}
			
# 			if obj['group_name'] == '' or obj['group_name'] is None:
# 				return False, message
			
# 			if obj['group_password'] == '' or obj['group_password'] is None:
# 				return False, message
			
# 			return True, message, {}

# 		# def check_user_obj(obj, user_obj):
# 		def check_user_obj(obj):
# 			"""
# 			# Checks That: 
# 			# 	- user email does not exist OR is not blank
# 			# 	- user pswd does not exist OR is not blank
# 			"""
# 			message = 'Need A Unique User Name And Password'
# 			user_obj = spd_user()
			
# 			user_email = list(mongo_client.local_spd[user_obj.__class__.__name__].find({'Email':obj['user']['Email']}))
# 			user_pswd = list(mongo_client.local_spd[user_obj.__class__.__name__].find({'Password':obj['user']['Password']}))

# 			if len(user_email) > 0:
# 				message = 'User Email Already Exists Email Already Exists'
# 				return False, message, {'Email': obj['user']['Email'], 'Password': obj['user']['Password']}
			
# 			if len(user_pswd) > 0:
# 				message = 'User Password Already Exists'
# 				return False, message, {'Email': obj['user']['Email'], 'Password': obj['user']['Password']}
			
# 			if obj['user']['Password'] == '' or obj['user']['Password'] is None:
# 				return False, message, None
			
# 			if obj['user']['Email'] == '' or obj['user']['Email'] is None:
# 				return False, message, None
			
# 			return True, message, None

		
# 		# -----------------------------
# 		resp = copy(SUCCESS)
# 		body = request.get_json()
# 		body_keys = body.keys()

# 		MUST = [ 'sub_id', 'pg_id', 'hash', 'trans_id']
# 			
# 		if all( key in body_keys for key in MUST):

# 				
# 			if body['type']=='multi' and 'admin_user' in body.keys() and 'users' in body.keys():
			
# 				# -- validate all users, fail with 500 if not all valid
# 				for user in body['users']:
# 					user = {'user': user}

# 					passes, message, email = check_user_obj(user)
# 					if passes:
# 						continue
# 					else:
# 						resp = copy(ERROR)
# 						resp['message'] = message
# 						resp['failed_user'] = email
# 						return jsonify(resp), 500
				
# 				user = {'user': body['admin_user'] }
				
# 				passes_admin, message, email = check_user_obj(user)
# 				if passes_admin:

# 					passess_memb, message, email = check_memb_obj(body)
# 					if passess_memb:

# 						memb_id = uuid.uuid4()
# 						try:
							
# 							memb = spd_membership()
# 							body['created_at'] = datetime.now()
# 							body['expires_on'] = datetime.now()
# 							body['id'] = memb_id

# 							to_write = memb.map(body)

# 							mongo_write = mongo_client.local_spd[memb.__class__.__name__].insert(to_write)
						
# 						# if error in membership write, 500
# 						except:
# 							resp = copy(ERROR)
# 							resp['message'] = 'Group Name Or Password Already Exists. Need Unique Both'
# 							resp['failed'] = {
# 								'group_name': body['group_name'],
# 								'group_password': body['group_password']
# 							}
							
# 							return jsonify(resp), 500

# 						# create user as admin
# 						try:
# 							_user = spd_user()

# 							body['admin_user']['membership_id'] = memb_id
# 							body['admin_user']['is_self_admin'] = False
# 							body['admin_user']['is_group_admin'] = True
# 							body['admin_user']['_id'] = uuid.uuid4()

# 							

# 							to_write_user = _user.map(body['admin_user'])

# 							
# 							mogno_write = mongo_client.local_spd[_user.__class__.__name__].insert_one(to_write_user)

# 						# if error in admin user write, 500
# 						except:
# 							resp = copy(ERROR)
# 							resp['message'] = 'User Email Already Exists'
# 							resp['failed'] = body['admin_user']
# 							return jsonify(resp), 500


# 						# create regular users
# 						to_write = []
# 						try:
# 							for user in body['users']:
# 								user['membership_id'] = memb_id
# 								user['is_self_admin'] = False
# 								user['is_group_admin'] = False
# 								user['id'] = uuid.uuid4()

# 								user_write = _user.map(user)
# 								to_write = mongo_client.local_spd[_user.__class__.__name__].insert(user_write)
								
								
# 							# 	user_write = _user.map(user)
# 							# 	to_write.append(user_write)
							
# 							# 
# 							# to_write = mongo_client.local_spd[_user.__class__.__name__].insert_many(to_write)
# 						# if error in bulk write, 500
# 						except:
# 							raise
# 							resp = copy(ERROR)
# 							resp['message'] = 'Bulk Write Fail'
# 							# resp['failed'] = body['admin_user']
# 							return jsonify(resp), 500

						
# 						return jsonify(resp), 200
					
# 					# if does not pass membership_check, 500
# 					else:
# 						resp = copy(ERROR)
# 						resp['message'] = message
# 						resp['failed_membership'] = email
# 						return jsonify(resp), 500
				
# 				# if does not pass admin_user check, 500
# 				else:
# 					resp = copy(ERROR)
# 					resp['message'] = message
# 					resp['failed_user'] = email
# 					return jsonify(resp), 500
			
			
# 			elif body['type']=='single':

# 					
# 				passes, message, email = check_user_obj(body)
				
# 				if passes:
# 					memb = spd_membership()
# 					memb_id = uuid.uuid4()
					
# 					body['created_at'] = datetime.now()
# 					body['expires_on'] = datetime.now()
# 					body['_id'] = memb_id

# 					try:
# 						to_write_membership = memb.map(body)
# 						mongo_insert = mongo_client.local_spd[ memb.__class__.__name__ ].insert(to_write_membership)
# 						body['user']['membership_id'] = memb_id
# 						body['user']['id'] = uuid.uuid4()
						
# 						try:
# 							_user = spd_user()
# 							insert_user = mongo_client.local_spd[_user.__class__.__name__].insert(_user.map(body['user']))
						
# 						except: 
# 							resp = copy(ERROR)
# 							resp['message'] = ['That User Email Already Exists']
# 							return jsonify(resp), 500
						
# 						return jsonify(resp), 200
					
# 					except:
# 						resp = copy(ERROR)
# 						resp['message'] = ['That Membership Namme Already Exists']
# 						return jsonify(resp), 500
					
# 					return jsonify(resp), 200
				
# 				else:
# 					resp = copy(ERROR)
# 					resp['message'] = ['Every User Needs A Unique Email And Unique Password']
# 					resp['failed_user'] = body['user']
# 					return jsonify(resp), 500
			
# 			else:
# 				resp = copy(ERROR)
# 				resp['accepted_types'] = {
# 					'type': ['single', 'multi'], 
# 					'user': ['user', 'admin_user']
# 				}
# 				return jsonify(resp), 500


# 		else:
# 			resp = copy(ERROR)
# 			resp['message'] = 'Body is Missing Keys'
# 			resp['keys'] = MUST
# 			return jsonify(resp), 500
	
# 	except:
# 		resp = copy(ERROR)
# 		resp['message'] = sys.exc_info()[0]
# 		return jsonify(resp), 500


