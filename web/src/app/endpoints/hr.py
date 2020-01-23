import os, sys, json
from copy import copy 

from flask import Blueprint, Response, request, abort, jsonify

from utils.responses import SUCCESS, ERROR, INCORRECT_KEYS, required_keys
from utils.requests import validate_body, validate_shape
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))
from lib.controllers.hr import HR_controller
from lib.domain.hr.employees import employee


_hr_tasks = Blueprint('hr_tasks', __name__)

@_hr_tasks.route('/employees', methods=['POST'])
def retrieve():
	find = {
		'meta': {'meta':'departments'},
		'all': ['all'],
		'by_dep_id': ['department_id', 'id'],
		'one': ['employee_id', 'id'],
		"brief_by_employee": ['brief_id']
		# 'update': ['employee_id', 'update']
	}
	request_keys = request.get_json().keys()
	request_body = request.get_json()
	action, body_valid = validate_body(find, request_keys)
	if body_valid:
		try:
			resp = copy(SUCCESS)
			_hr = HR_controller()
			
			if action == 'all':
				data, total = _hr.all_employees()
				resp['all_employees'] = data
				resp['total'] = total
			
			if action=='meta' and request_body['meta']=='departments':
				resp['department_ids'] = _hr.unique_department_ids()
			
			if action=='by_dep_id':
				_id = request_body['id']
				data, total = _hr.employees_by_department_id(int(_id))
				resp['department_id'] = _id
				resp['employees'] = data
				resp['total'] = total
			
			if action=='one':
				_id = request_body['id']
				resp['employee'] = _hr.get_employee(int(_id))
			
			if action=='update':
				if validate_shape(request_body['update'], 'dict'):
					resp['updated_id'] = _hr.update_employee()
				else:
					resp = required_keys(find)
					return jsonify(resp), 500
			
			return jsonify(resp), 200
		except:
			resp = copy(ERROR)
			resp['message'] = sys.exc_info()[0]
			return jsonify(resp), 500
	else:
		resp = required_keys(find)
		return jsonify(resp), 500


@_hr_tasks.route('/edit', methods=['PUT'])
def edit():
	find = {
		'edit_employee': ['employee_id','update'],
		'edit_hr_configurable': ['configuraid','type','update'],
		'meta': ['options']
	}
	request_body = request.get_json()
	request_keys = request.get_json().keys()
	action, body_valid = validate_body(find, request_keys)
	if body_valid:
		try:
			resp = copy(SUCCESS)
			_hr = HR_controller()
			
			if action=='edit_employee':
				if validate_shape(request_keys['update'], 'dict'):
					updated = _hr.update_employee(request_body['update'])
					resp['employee_id'] = request_body['employee_id']
					if updated: 
						resp['updataed_employee'] = True
					else:
						resp['updataed_employee'] = False
						resp['status'] = 'fail'
					return jsonify(resp), 200
				else:
					resp = required_keys(find)
					resp['message'] = '[update] must be an object/dictionary'
					return jsonify(resp), 500 
			else:
				resp = required_keys(find)
				resp['message'] = "['update'] must be an object"
				return jsonify(resp), 500
		except:
			resp = copy(ERROR)
			resp['message'] = 'An Error Occurred'
			return jsonify(resp), 500
	else:
		resp = required_keys(find)
		return jsonify(resp), 500


# create items
@_hr_tasks.route('/make', methods=['POST']) 
def create():
	find = {
		'one-employee': ['employee', 'new'],
		'one-configurable': ['configurable', 'new']
	}
	request_body = request.get_json()
	request_keys = request.get_json().keys()
	action, body_valid = validate_body(find, request_keys)

	if body_valid:
		try:
			resp = copy(SUCCESS)
			_hr = HR_controller()
			if action=='one-employee':
				if validate_shape(request_body['new'], 'dict'):
					created = _hr.create_employee(request_body['new'])
					if created: 
						resp['created_employee'] = True
					else:
						resp['created_employee'] = False
						resp['status'] = 'fail'
				else:
					resp = required_keys(find)
					resp['message'] = '[new] must be an object/dictionary'
					return jsonify(resp), 500
			if action=='one-configurable':
				if validate_shape(request_body['new'], 'dict'):
					created = _hr.create_configurable(
						request_body['new'])
					if created: 
						resp['created_configurable'] = True
					else:
						resp['created_configurable'] = False
				else:
					resp = required_keys(find)
					resp['message'] = '[new] must be an object/dictionary'
					return jsonify(resp), 500
			return jsonify(resp), 200
		except:
			resp = copy(ERROR)
			resp['message'] = sys.exc_info()[0]
			return jsonify(resp), 500
	else:
		resp = required_keys(find)
		return jsonify(resp), 500
