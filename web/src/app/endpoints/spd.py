import sys, copy, os, pprint, pdb, uuid
from copy import copy, deepcopy
from datetime import datetime

from utils.responses import SUCCESS, ERROR, INCORRECT_KEYS, required_keys, drop_underscore
from utils.requests import validate_body, validate_shape
# from lib.domain_auth import auth_resp, membership, user
from lib.domain_auth import auth_resp as authorize_resp
from lib.domain_auth import user as spd_user
from lib.domain_auth import membership as spd_membership

from lib.domain_auth import controller_subscriptions
from lib.domain_auth import controller_pharmacy
from lib.domain_auth import controller_auth_resp

from lib.domain_auth import controller_membership



from flask import Blueprint, Response, request, abort, jsonify
from pymongo import MongoClient

# -------------------------------------------------
client = MongoClient('mongodb://localhost:27017/')
# memb = membership()
# _user = user()

# -------------------------------------------------
_spd = Blueprint('spd', __name__)

@_spd.route('/membership_users', methods=['POST'])
def get_users_by_memb_id():
	try:
		resp = copy(SUCCESS)
		body = request.get_json()
		body_keys = body.keys()
		
		MUST = [ 'memb_id' ]
		if all( item in MUST for item in body_keys):
			memb_controller = controller_membership()
			admin, users = memb_controller.retrieve_users_for_membership( body['memb_id'] )
			resp['users'] = users
			resp['admin_user'] = admin
			return jsonify(resp), 200
		else:
			resp = copy(ERROR)
			resp['message'] = 'Required Body Keys :'
			resp['keys'] = MUST	
			return jsonify(resp), 500
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500

@_spd.route('/completed', methods=['POST'])
def transaction():
	try:
		body = request.get_json()
		post = { 'hash': 'string', 'email': 'string', 'data': 'dict', 'auth_id': 'str'}
		resp = copy(SUCCESS)

		if body['email'] is not None and isinstance(body['email'], str):
			
			if body['data'] is not None and isinstance(body['data'], dict):
				
				if body['hash'] is not None and isinstance(body['hash'], str):

					if body['hash'] is not None and isinstance(body['auth_id'], str):

						
						controller = controller_auth_resp()
						written, trans_id, auth_id = controller.save_transaction( 
							body['data'], body['email'], body['hash'], body['auth_id']
						)

						if written:
							resp = copy(SUCCESS)
							resp['message'] = 'Saved Transaction Meta Data!'
							resp['hash'] = body['hash']
							resp['trans_id'] = trans_id
							resp['auth_id'] = trans_id
							return jsonify(resp), 200
						
						else:
							resp = copy(ERROR)
							resp['message'] = 'Did Not Save Transaction. Please Retry'
							return jsonify(resp), 500
					else:
						resp = copy(ERROR)
						resp['message'] = 'Body Needs To Look Like :'
						resp['body'] = post
						return jsonify(resp), 500

				else:
					resp = copy(ERROR)
					resp['message'] = 'Body Needs To Look Like :'
					resp['body'] = post
					return jsonify(resp), 500
			else:
				resp = copy(ERROR)
				resp['message'] = 'Body Needs To Look Like :'
				resp['body'] = post
				return jsonify(resp), 500
		else:
			resp = copy(ERROR)
			resp['message'] = 'Body Needs To Look Like :'
			resp['body'] = post
			return jsonify(resp), 500
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500

@_spd.route('/meta', methods=['POST'])
def find():
	PARAMS = {
		'trans-hash': None,
		'user-meta': 'Email',
		'subscript-cols': None,
		'subscript-meta': None,
		'records-cols': None,
		'records-meta': None,
		'user-search': {
			'user-by-memb-id': 'membership_id',
			'user-by-email': 'Email',
			'user-by-group-name': 'Group_Name'
		}
	}
	try: 
		body = request.get_json()
		resp = copy(SUCCESS)

		# -- Good
		if body['type']=='trans-hash':
			resp['hash'] = str(uuid.uuid4())
		
		# -- Good
		elif body['type']=='user-meta' and isinstance(body['type'], str):
			_user = spd_user()
			if 'underscore' in body and body['underscore'] == 'drop':
				resp['user_cols'] = [ drop_underscore(i) for i in _user.map({}) ]
			else:
				resp['user_cols'] = [ i for i in _user.map({}) ]

		# ::: UN-TESTED :::
		elif body['type']=='user-search' and isinstance(body['type'], dict):
			total = 0
			search = body['user-search']
			
			search_by = None
			for k,v in search.items():
				if k in PARAMS['user-search']:
					total += 1
					search_by = v

			if total > 1:
				resp = copy(ERROR)
				resp['message'] = '[user-search] can only have one key'
				resp['keys'] = list(PARAMS['user-search'].keys())
				return jsonify(resp), 500
			
			else:
				if 'value' not in body:
					resp['message'] = 'body[value] = ?'
					resp['message'] = 'Need to provide "value" in body'
					return jsonify(resp), 500
				else:
					controller = spd_user()
					users = spd_user.user_search( search_by, body['value'])
					resp['users'] = users
					return jsonify(resp), 200

		# -- Good
		elif body['type']=='subscript-cols':
			controller = controller_subscriptions()
			resp['subcription_cols'] = [ drop_underscore(i) for i in controller.meta_cols() ]

		# ::: NEEDS TROUBLE SHOOTING :::
		elif body['type']=='subscript-meta':
			controller = controller_subscriptions()
			resp['subcritions_meta'] = controller.get_subscriptions()

		elif body['type']=='records-cols':
			controller = controller_pharmacy()
			resp['records_cols'] = [ drop_underscore(i) for i in controller.meta_cols() ]
			# resp['records_cols'] = controller.meta_cols()
		
		elif body['type']=='records-access':
			controller = controller_pharmacy()
			resp['records_access'] = controller.meta_access()
		
		else:
			resp = copy(ERROR)
			resp['message'] = 'Can Provide Only One Key'
			resp['keys'] = list(PARAMS.keys())
			return jsonify(resp), 500
		
		return jsonify(resp), 200
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500

@_spd.route('/data', methods=['POST'])
def pharmacies():
	post = { 
		'get': [ 'access', 'email', 'records']
	}
	try:
		
		body = request.get_json()
		resp = copy(SUCCESS)

		ACCESS = { 'Basic': None, 'Pro': None }
		
		# if all( key in body.keys() for key in post['get'] ) and \
		# 	all( isinstance( body[key], str) for key in body.keys()) :
		
		if all( key in body.keys() for key in post['get'] ) :
			
			if isinstance( body['records'], int) or body['records']=='*':

				if body['access'] not in ACCESS:
					resp = copy(ERROR)
					resp['message'] = 'Incorrect ACCESS TYPE'
					resp['options'] = list( ACCESS.keys() )
					return jsonify(resp), 500

				controller = controller_pharmacy()
				records = controller.get_pharmacies( body['email'], body['access'], body['records'])
				resp['data'] = records
				resp['total'] = len(records)
			
			else:
				resp = copy(ERROR)
				resp['message'] = 'Incorrect Body. Keys must be strings'
				resp['keys'] = 'The value to [records] but be an integer'
				return jsonify(resp), 500
		
		else:
			resp = copy(ERROR)
			resp['message'] = 'Incorrect Body. Keys must be strings'
			resp['keys'] = post['get']
			return jsonify(resp), 500

		return jsonify(resp), 200
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500
	



	

	






























