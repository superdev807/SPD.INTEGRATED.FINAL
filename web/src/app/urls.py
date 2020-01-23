from endpoints.auth import _auth
from endpoints.spd import _spd

API_BASE_URL = '/api/v1'

ENDPOINTS = {
	API_BASE_URL + '/auth': _auth,
	API_BASE_URL + '/spd': _spd
}





"""
-- STASHING 

from endpoints.bpb.briefs import _briefs
from endpoints.bpb.plans import _plans
from endpoints.bpb.buys import _buys

from endpoints.hr import _hr_tasks
from endpoints.source_refs import _source_refs_endpoints
from endpoints.auth import _auth

API_BASE_URL = '/api/v1'

NEW_ENDPOINT_BASE = '/whacky/hellow/world'
HARMELIN_BASE = '/harmelin'
ENDPOINTS = {
	API_BASE_URL + '/briefs': _briefs,
	API_BASE_URL + '/plans': _plans,
	API_BASE_URL + '/buys': _buys,
	API_BASE_URL + '/hr': _hr_tasks,
	API_BASE_URL + '/sources': _source_refs_endpoints,
	API_BASE_URL + '/auth': _auth
}


"""