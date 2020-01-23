import os, sys, pprint

# from models import pharmacies

# import pdb
# pdb.set_trace()

class subscription_controller(object):
	def __init__(self):
		self.calendar_days = {
			'7 Days': 7,
			'1 Month': 31,
			'12 Months': 365
		}

	# def calendar_day_options(self):
	# 	return self.calendar_days

	# def orm_options(self):
	# 	# derp = ( (day_value, display_text) for display_text, day_value in self.calendar_days().iteritems()  )
		
	# 	# import pdb 
	# 	# pdb.set_trace()
		
	# 	return ( (day_value, display_text) for display_text, day_value in self.calendar_days().iteritems()  )
		
	# 	# return [(day_value, display_text) for display_text, day_value in self.calendar_days().iteritems()]


# class pharma_controller(object):
	
# 	def __init__(self):
# 		self.pharma_db = pharmacies
# 		self.access = {
# 			1: {
# 				'columns': [
# 					"Pharmacy_Name", "URL", "Street_Address", "City", "State", "Zip", "Phone", "Conditions", "Company_Type"
# 				],
# 				'type': 'Basic'
# 			}, 
# 			2: {
# 				'columns': [],
# 				'type': 'Pro'
# 			}
# 		}	
	
# 	def access_types(self):
# 		return [ data['type'] for _id, data in self.access.items() ]

# 	def get_pharmacies(self, params={}):
# 		pass

