import sys, copy, os, pprint, pdb, uuid
from copy import copy, deepcopy
from datetime import datetime

from utils.responses import SUCCESS, ERROR, INCORRECT_KEYS, required_keys, drop_underscore
from utils.requests import validate_body, validate_shape
# from lib.domain_auth import auth_resp, membership, user
from lib.domain_auth import auth_resp as authorize_resp
from lib.domain_auth import user as spd_user
from lib.domain_auth import membership as spd_membership

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
			resp['users'] = { 'admin_user': None, 'users': None }
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
def authorize():
	try:
		resp = copy(SUCCESS)
		auth_resp = body['transaction']

		return jsonify(resp), 500
	except:
		resp = copy(ERROR)
		resp['message'] = sys.exc_info()[0]
		return jsonify(resp), 500

@_spd.route('/subscriptions', methods=['GET'])
def _subscripts():
	resp = copy(SUCCESS)
	records = list(client.local_spd.subscriptions.find({}))
	resp['data'] = records
	resp['total'] = len(records)

	return jsonify(resp), 200