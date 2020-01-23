import os, sys, pprint, csv, argparse, pdb, uuid

import django
from pymongo import MongoClient
# from domain_auth import subscriptions, pharmacies



# ------------------------------------
pp = pprint.PrettyPrinter(indent=4)

# ------------------------------------
mongo_client = MongoClient('mongodb://localhost:27017/')

# ------------------------------------
ACCESS_PRO = '*'
ACCESS_BASIC = [ 'Pharmacy Name', 'URL', 'Street Address', 'City', 'State', 'Zip', 'Phone', 'Conditions', 'Company Type' ]

# ------------------------------------ 
def prep_obj(obj):
	obj = obj.__dict__

	obj['_id'] = uuid.uuid4()
	obj['pg_id'] = obj['id']
	
	del obj['_state']
	del obj['id']
	
	return obj

# ------------------------------------
if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Building Mongo')
	parser.add_argument(
		'--action',
        required=True,
        type=str,
        help='[ingest-pharmacies], [drop-pharmacies], [drop-subscriptions], [ingest-subscriptions]',
        default=False)
	parsed_args = parser.parse_args()

	if 'ingest' in parsed_args.action:
		print('\n\n **** sys.path ::')
		print(sys.path)

		print('\n\n **** DJANGO ENV ::')
		# pp.pprint(os.environ)
		print(os.getenv("DJANGO_SETTINGS_MODULE"))

		print('\n\n **** Adding To Path Two Directories Up ::')
		BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
		print(BASE_DIR)

		print('\n\n **** Appending To Sys Path ::')
		sys.path.append(BASE_DIR)
		print(sys.path)

		print('\n\n **** UPDATING DJANGO ENV ::')
		# django project name is adleads, replace adleads with your project name
		# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "adleads.settings")
		os.environ.setdefault("DJANGO_SETTINGS_MODULE", "main.settings")
		print(os.getenv("DJANGO_SETTINGS_MODULE"))

		print('\n\n **** running [ django.setup() ]; Now sys.path ::')
		django.setup()
		print(sys.path)
		
		if parsed_args.action == 'ingest-pharmacies':
			from spd.models import pharmacies as spd_pharm

			table = 'pharmacies'
			pharms = spd_pharm.objects.all()

			# ----------
			COUNT = 0
			TO_WRITE = []
			
			def prep_pharm(obj, count):
				obj = obj.__dict__
				obj['_id'] = uuid.uuid4()
				obj['pg_id'] = count
				del obj['_state']
				del obj['id']
				return obj

			for pharm in pharms:
				COUNT += 1
				TO_WRITE.append( prep_pharm( pharm, COUNT ))

			ingest = mongo_client.local_spd[table].insert_many( TO_WRITE )

			# ----------
			# ingest = mongo_client.local_spd[table].insert_many([ prep_obj(pharm) for pharm in pharms ])

			DROP_COLS = {'id': None}
			cols = []
			for i in spd_pharm._meta.fields:
				if i.name in DROP_COLS:
					pass
				cols.append(i.name)
			update_meta = mongo_client.local_spd[table].insert({
				'type': 'cols',
				'values': cols
			})
			update_meta = mongo_client.local_spd[table].insert({
				'type': 'access',
				'availb_cols': {
					'Basic': ACCESS_BASIC,
					'Pro': ACCESS_PRO
				}
			})

		if parsed_args.action == 'ingest-subscriptions':
			from subscripts.models import subscriptions_type as spd_subscripts
			from subscripts.models import Options_Duration, Options_Cost, Options_Access

			table = 'subscriptions'
			subs = spd_subscripts.objects.all()
			subs = [ prep_obj(sub) for sub in subs ]

			for sub in subs:
				duration = sub['Duration_id']
				cost = sub['Cost_id']
				access = sub['Access_id']

				durationn_obj = Options_Duration.objects.get(display=duration)
				sub['calendar_days'] = durationn_obj.calendar_days

				cost_obj = Options_Cost.objects.get(display=cost)
				sub['cost_dollars'] = cost_obj.cost

				access_obj = Options_Access.objects.get(id=access)
				sub['access_type'] = access_obj.display

			ingest = mongo_client.local_spd[table].insert_many( subs )

			DROP_COLS = {'id': None}
			cols = []
			for i in spd_subscripts._meta.fields:
				if i.name in DROP_COLS:
					pass
				cols.append(i.name)
			update_meta = mongo_client.local_spd[table].insert({
				'type': 'cols',
				'values': cols
			})

	else:
		if parsed_args.action == 'drop-pharmacies':
			table = 'pharmacies'
			dropped = mongo_client.local_spd[table].drop()
		
		if parsed_args.action == 'drop-subscriptions':
			table = 'subscriptions'
			dropped = mongo_client.local_spd[table].drop()

		
