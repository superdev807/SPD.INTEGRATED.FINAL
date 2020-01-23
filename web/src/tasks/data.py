import sys, copy, os, pprint, pdb, argparse


from domain_auth import auth_resp, membership, user

from pymongo import MongoClient

# ------------------------------------
pp = pprint.PrettyPrinter(indent=4)

# ------------------------------------
mock = 'test'
mongo_client = MongoClient('mongodb://localhost:27017/')

# ------------------------------------
def make_collection(domain_obj, example):
	values = domain_obj.values()
	table = domain_obj.__class__.__name__
	to_write = { i:example for i in values }
	inserted = mongo_client.local_spd[table].insert(to_write)

	if table == 'user':
		index = mongo_client.local_spd[table].create_index(('Email'),unique=True)

def drop(domain_obj):
	table = domain_obj.__class__.__name__
	dropped = mongo_client.local_spd[table].drop()

def import_subsriptions():
	pass

# ------------------------------------
if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Building Mongo')
	parser.add_argument(
		'--action',
        required=True,
        type=str,
        help='[build] or [drop]',
        default=False)
	parsed_args = parser.parse_args()

	if parsed_args.action == 'build-mongo':
		_user = user()
		make_collection(_user, mock)

		_auth_resp = auth_resp()
		make_collection(_auth_resp, mock)

		_membership = membership()
		make_collection(_membership, mock)

	if parsed_args.action == 'drop-mongo':
		_user = user()
		drop(_user)

		_auth_resp = auth_resp()
		drop(_auth_resp)

		_membership = membership()
		drop(_membership)

	if parsed_args.action == 'import-pharma-csv-postgres':
		pass