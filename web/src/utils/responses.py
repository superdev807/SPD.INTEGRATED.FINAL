# utility functions for outbound responses
from copy import copy

# Common Message Response Messages
SUCCESS = {'status': 'success'}
ERROR = {'status': 'error'}
INCORRECT_KEYS = {
	'status': 'error',
	'message': 'You are Not Passing The Correct Keys',
	'hint': 'Please Use Only One Of the Unique Combos From [key_options]:',
}

# -- append ['keys'] the INCORRECT_KEYS error  message
def required_keys(required):
	incorrect_keys_message = copy(INCORRECT_KEYS)
	incorrect_keys_message['key_options'] = required
	return incorrect_keys_messages

def json_prep(model_obj):
	pass
