import os, sys, json
from copy import copy 

from flask import Blueprint, Response, request, abort, jsonify

from utils.responses import SUCCESS, ERROR, INCORRECT_KEYS, required_keys
from utils.requests import validate_body, validate_shape
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))
from lib.controllers.ref_sources import ref_sources_controller


_source_refs_endpoints = Blueprint('source_refs', __name__)

@_source_refs_endpoints.route('/find', methods=['POST'])
def get():
	client_and_bus_unit = ['source', 'client_name', 'business_unit']
	find = {
		'meta_sources': ['meta', 'sources'],
		'unique_by_source': ['unique', 'source', 'client_name'],
		'all': ['all', 'source'], 
		'client_all_sources': ['all', 'client_name'],
		'client_by_source': ['source', 'client_name'],
		'business_unit_by_source': client_and_bus_unit.append('specific')
	}
	request_keys = request.get_json().keys()
	request_body = request.get_json()
	action, body_valid = validate_body(find, request_keys)
	if body_valid:
		try:
			resp = copy(SUCCESS)
			_sources = ref_sources_controller()

			if action == 'meta_sources':
				resp['available_sources'] = _sources.get_sources()

			if action=='client_by_source' and request_body['soucrce'] in _sources.get_sources():
				data = _source.client_by_source({
					'client_name': request_body['client_name'],
					'source': request_body['source']
				})
				if data:
					resp['client_data'] = data
					resp['source'] = request_body['soucrce']
				else:
					resp['message'] = 'You Are Not Passing a Valid Source'
					resp['sources'] = _sources.get_sources()

			if action=='client_by_source':
				data = _source.unique_client_names({
					'client_name': request_body['client_name'],
					'source': request_body['source']
				})
				if data:
					resp['client_data'] = data
					resp['source'] = request_body['soucrce']
				else:
					resp['message'] = 'You Are Not Passing a Valid Source'
					resp['sources'] = _sources.get_sources()

			if action=='client_all_sources':
				data = _sources.client_from_all_sources({
					'client_name': request_body['client_name']
				})
				
				if data:
					resp['client_data'] = data
					resp['source'] = request_body['soucrce']
				else:
					resp['message'] = 'You Are Not Passing a Valid Source'
					resp['sources'] = _sources.get_sources()

			return jsonify(resp), 200
		except:
			resp = copy(ERROR)
			resp['message'] = sys.exc_info()[0]
			return jsonify(resp), 500
	else:
		resp = required_keys(find)
		return jsonify(resp), 500