import os, sys, pprint

import django

pp = pprint.PrettyPrinter(indent=4)


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

# django project name is adleads, replace adleads with your project name
# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "adleads.settings")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "web.src.main.settings")

print('\n \n ********************* DJANGO ENV:')
# pp.pprint(os.environ)
print(os.getenv("DJANGO_SETTINGS_MODULE"))
print('********************* \n \n')

django.setup()

print('\n \n &&&&&&&&&&&&&&&&&&&&&')
print(sys.path)
print('&&&&&&&&&&&&&&&&&&&&& \n \n')

# from web.src.spd import pharmacies



# from web.src.spd import pharmacies

# from core.models import (
#     Company, 
#     DomainDetails, 
#     SponsorshipTrail, 
#     JobBoard
# )

# Your script code