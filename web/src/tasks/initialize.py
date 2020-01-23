import pdb

from examples import TRANSACTION

import requests


URL_BASE = 'http://localhost:5000'
# get subscriptions 
# load meta data 
#	


# -----
# save transactional data
URL = URL_BASE + '/api/v1/spd/completed'
DATA = TRANSACTION

pdb.set_trace()

resp = requests.post(url=URL, data=DATA)

pdb.set_trace()





