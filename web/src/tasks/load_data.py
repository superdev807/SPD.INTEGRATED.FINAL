import os, sys, pprint
import csv

import django

pp = pprint.PrettyPrinter(indent=4)

FILE_PATH = 'data/pharmacies.csv'

print('\n \n &&&&&&&&&&&&&&&&&&&&&')
print(sys.path)
print('&&&&&&&&&&&&&&&&&&&&& \n \n')

print('\n \n ********************* DJANGO ENV:')
# pp.pprint(os.environ)
print(os.getenv("DJANGO_SETTINGS_MODULE"))
print('********************* \n \n')

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
print('\n \n +++++++++++++++++++++')
print(BASE_DIR)
print('+++++++++++++++++++++ \n \n')

print('\n \n &&&&&&&&&&&&&&&&&&&&&')
sys.path.append(BASE_DIR)
print(sys.path)
print('&&&&&&&&&&&&&&&&&&&&& \n \n')

print('\n \n &&&&&&&&&&&&&&&&&&&&&')
print(sys.path)
print('&&&&&&&&&&&&&&&&&&&&& \n \n')

# django project name is adleads, replace adleads with your project name
# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "adleads.settings")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "main.settings")

print('\n \n ********************* DJANGO ENV:')
print(os.getenv("DJANGO_SETTINGS_MODULE"))
print('********************* \n \n')

django.setup()

print('\n \n &&&&&&&&&&&&&&&&&&&&&')
print(sys.path)
print('&&&&&&&&&&&&&&&&&&&&& \n \n')

from spd.models import pharmacies

# ----- Your script code
def _prep_phone_number(number_as_string):
	# import pdb 
	# pdb.set_trace()
	
	# if number_as_string==None:
	# 	return number_as_string
	# else:
	# 	# return int(number_as_string.strip('-'))
	# 	# return int(number_as_string.replace('-',''))
	# 	number_as_string = number_as_string.replace('-','')
	# 	return int(number_as_string)
	
	try:
		if len(number_as_string.split('-')) == 3:
			print('33')
			new = int(number_as_string.replace('-',''))
			return new
		else:
			print('-- Not 3')
			return None

		# if 'x' in number_as_string:
		# 	return None
		# else:`
		# 	new = int(number_as_string.replace('-',''))
		# 	return new

		# new = int(number_as_string.replace('-',''))
		# return new
	
	except ValueError:
		print('\n \n Invalid value!')
		return '---'
		

def _map(params):
	# import pdb
	# pdb.set_trace()
	return pharmacies(
		Name=params.get("Pharmacy Name",None),
		URL=params.get("Pharmacy_url",None),
		Street=params.get("Street Address",None),
		City=params.get("City",None),
		State=params.get("State_ab",None),
		State_full=params.get("State",None),
		Zip=params.get("Zip Code",None),
		# Phone=params.get("Phone",None),
		# Phone=_prep_phone_number(
		# 	params.get("Phone",None)
		# ),
		Phone='--place holder',
		Conditions=params.get("Conditions Served",None),
		Contact=params.get("Pharmacy Contact",None),
		Company_Type=params.get("Company Type",None),
		Contact_Email=params.get("Contact Email",None),
		Accreditation=params.get("Accreditation",None),
		Owner_Independent=params.get("Ownership",None),
		Patient_Services=params.get("Patient Services",None),
		Payer_Services=params.get("Payer Services",None),
		Pharma_Services=params.get("Pharmaceutical Services",None),
		Locations=params.get("Pharmacy Locations",None),
		Limted_Distribution_Drugs=params.get("Limited Distribution Drugs",None)
	)


def read_chunks():
	with open(FILE_PATH) as csvfile:
		to_write = []
		count = 0
		
		print('\n \n ... Reading File')
		reader = csv.DictReader(csvfile)

		for row in reader:
			if count == 100:
				send = to_write
				to_write = []
				count = 0
				yield send
			else:
				count += 1
				to_write = _map(row)

# pharmacies.objects.bulk_create(read_chunks())
# print('\n \n SUCCESS!')

__NEW__COUNT = 0
def read_all_and_map():
	print('\n \n ... Reading File')
	derp = 0
	with open(FILE_PATH) as csvfile:
		skurt = 0
		reader = csv.DictReader(csvfile)
		# to_load = []
		# for row in reader:
		# 	skurt += 1
		# 	mapped = _map(row)
		# 	print('-- ITEM !')
		# 	to_load.append(mapped)
		# print('\n \n Total Rows Mapped: ' + str(skurt))
		
		to_load = [_map(row) for row in reader]
		print('\n \n Total Rows Mapped: ' + str(len(to_load)))
		return to_load

print('\n \n Begin Reading All')
mapped = read_all_and_map()
print('\n \n .. Attempting Bulk_Create = ')
bulked = pharmacies.objects.bulk_create(mapped)
print(len(bulked))
import pdb
pdb.set_trace()
print(' -- SUCCESS !')




"""

with open(FILE_PATH) as csvfile:
		print('\n \n ... Reading File')
		reader = csv.DictReader(csvfile)

		for row in reader:
			print('-- mapping')
			mapped = _map(row)

			# print('-- type(mapped)')
			# print(dir(mapped))
			# print(mapped.__dict__)
			# print(type(mapped))


			
			print('-- attempting to save')
			mapped.save()
	
	print('\n \n SUCCESS!')

	----------------------------------------------------
	for row in reader:
		print('\n \n ====================')
		print(type(row))
		print(row)
		print('==================== \n \n')

	to_write = [_map(row) for row in reader]

	



	----------------------------------------------------

	to_write = []
	count = 0
	for row in reader:
		if count == 100:

			print('\n \n -- Writing A Batch of 100')
			pharmacies.objects.bulk_create(to_write)
			print('\n \n -- Batch Written')

			count = 0 
			to_write = []

			to_write.append(_map(row))

		else:
			count += 1
			to_write.append(_map(row))

	----------------------------------------------------
	print('\n \n ... Mapping Data Objects')
	print('\n \n ... Attempting Bulk Write')
	# pharmacies.bulk_create(to_write)
	pharmacies.objects.bulk_create([_map(row) for row in reader])
	
	----------------------------------------------------
	print('\n \n ... Mapping Data Objects')
	to_write = [_map(row) for row in reader]

	print('\n \n ... Attempting Bulk Write')
	pharmacies.objects.bulk_create(to_write)
	----------------------------------------------------

"""
