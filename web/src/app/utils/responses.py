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
	return incorrect_keys_message

def drop_underscore(obj):
	if isinstance(obj, dict):
		scrubbed_obj = {}
		for k,v in obj:
			if '_' in k:
				scrubbed_obj[ k.replace('_',' ') ] = value
			else:
				scrubbed_obj[k] = value

	if isinstance(obj, str):
		if '_' in obj: 
			return obj.replace('_',' ')
		else:
			return obj
	else:
		return obj