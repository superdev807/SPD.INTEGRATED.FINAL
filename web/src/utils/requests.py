# utility functions for incoming requests 

# -- validate that only one list of required keys is the same 
# as an incoming request body
def validate_body(required, request_body):
	# total = 0 
	# for action, keys in required.items():
	# 	if keys == request_body:
	# 		total += 1
	# 		if total == 1:
	# 			return action, True
	# 	else:
	# 		pass
	# return None, False

	total = 0 
	request_body = set(request_body)
	for action, keys in required.items():
		_keys = set(keys)
		if _keys==request_body:
			total += 1
			if _keys==request_body and total==1:
				return action, True
	return None, False


# -- checks that an item is a python dictionary, as would be 
# when unpacked from request body. essentially, item is an object
def validate_shape(item, kind):
	if kind=='dict' and isinstance(item, dict):
		return True
	elif kind=='list' and isinstance(item, list):
		return True
	elif kind=='str' and isinstance(item, str) :
		return True
	elif kind=='int' and isinstance(item, int) :
		return True
	else:
		False