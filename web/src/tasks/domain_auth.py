import sys, copy, os, pprint

MEMBER = {}
MEMBERSHIP = {}

# class subscriptions(object):
# 	def __init__(self):
# 		self.attrs = {}

# class pharmacies(object):
# 	def __init__(self):
# 		self.attrs = {}

class auth_resp(object):
	def __init__(self):
		self.attrs = {}

	def map(self, params):
		return {
			'created_at': params.get('created_at', None),
			'': params.get('', None)
		}

	def values(self):
		return self.map({}).keys()

class membership(object):
	def __init__(self):
		self.attrs = {}

	def map(self, params):
		return {
			'name': params.get('name', None),
			'password': params.get('password', None),
			'transaction_authorize_id': params.get('transaction_authorize_id', None),
			'created_at': params.get('created_at', None),
			'expires_on': params.get('expires_on', None),
			'created_user_ids': params.get('created_user_ids', None),
			'created_user_emails': params.get('created_user_emails', None)
		}

	def values(self):
		return self.map({}).keys()

class user(object):
	def __init__(self):
		self.attrs = {}

	def map(self, params):
		return {
			'email': params.get('email', None),
			'password': params.get('password', None),
			'is_logged_in': params.get('is_logged_in', None),
			'membership_id': params.get('membership', None),
			'is_self_admin': params.get('is_self_admin', None),
			'is_group_admin': params.get('is_group_admin', None)
		}

	def values(self):
		return self.map({}).keys()
