import sys, copy, os, pprint, uuid, pdb

from uuid import UUID
from datetime import datetime as dt
from datetime import timezone
from datetime import timedelta as delt


from pymongo import MongoClient

# ----------------------------------------------------------
mongo_client = MongoClient('mongodb://localhost:27017/')

# ----------------------------------------------------------
MEMBER = {}
MEMBERSHIP = {}

# ----------------------------------------------------------
# 	PLACE HOLDERS FOR SQL IMPORT 
# 		attributes and values identified in Django/SQL world
class subscriptions(object):
	def __init__(self):
		self.attrs = {}

class controller_subscriptions(object):
	def __init__(self):
		self.domain = subscriptions()
	
	def _q(self):
		return mongo_client.local_spd[ self.domain.__class__.__name__ ]
	
	def meta_cols(self):

		pdb.set_trace()
		
		imported_values = [ 
			i for i in self._q().find({ 'type': 'cols' }) 
		][0]['values']
		
		cols = { col_name: None for col_name in imported_values }

		del cols['id']
		del cols['assigned_name']
		del cols['Active']
		del cols['Testing']
		del cols['descript_dur']
		del cols['descript_type']

		return list( cols.keys() )
	
	def get_subscriptions(self):
		return list( self._q().find( 
			{ 'Active': True },
			{ '_id': 0, 'Active': 0, 'Testing': 0, 'pg_id': 0 } 
		)  )

	def look_up(self, pg_id, _id):
		return self._q().find_one({
			'pg_id': pg_id, '_id': _id
		})

class pharmacies(object):
	def __init__(self):
		self.attrs = {}
		self.access = { 'basic': [], 'pro': '*' }

class controller_pharmacy(object):
	def __init__(self):
		self.domain = pharmacies()
	
	def _q(self):
		return mongo_client.local_spd[ self.domain.__class__.__name__ ]
	
	def meta_cols(self):
		to_drop = [ 'id' ]
		values = self._q().find_one( {'type': 'cols'} )
		values = values[ 'values' ]
		values_to_return = { i:None for i in values }
		for i in to_drop:
			del values_to_return[ i ]
		return list( values_to_return.keys() )
	
	def meta_access(self):
		access = self._q().find_one({'type': 'access'})
		access = access['availb_cols']
		return access
	
	def get_pharmacies(self, email, access, records):
		RETRIEVE = { 'type': { '$nin': [ 'cols', 'access' ] }}
		PROJECT = None
		DATA = None

		if records=='*':
			pass
		else:
			RETRIEVE['pg_id'] = { '$in': [ i for i in range( records + 1 ) ] } 

		if access=='Basic':
			obj = list( self._q().find({ 'type': 'access' }) ) 
			values = obj[0]['availb_cols']['Basic']
			PROJECT = { column:1 for column in values }
		else:
			pass

		if PROJECT:
			data = list( self._q().find( RETRIEVE, PROJECT ) ) 
		else:
			data = list( self._q().find( RETRIEVE ) ) 

		return data
		

# ----------------------------------------------------------
#  ! AUTHORIZE !
class hashes(object):
	
	def __init__(self):
		self.attrs = {}
	
	def map(self, params):
		return {
			'_id': uuid.uuid4(),
			'hash': params.get('hash', None)
		}

class controller_hashes(object):
	
	def __init__(self):
		self.domain = hashes()
	
	def _q(self):
		return mongo_client.local_spd[ self.domain.__class__.__name__ ]
	
	def create(self, _hash):
		self._q().insert_one( self.map({ 'hash': _hash }) )


# ----------------------------------------------------------
#  ! AUTHORIZE !
class auth_resp(object):
	def __init__(self):
		self.attrs = {}

	def map(self, params):
		trans_id = uuid.uuid4()
		obj = {
			'_id': trans_id,
			'created_at_utc': dt.now(tz=timezone.utc),
			'created_at_datetime': dt.now(),
			'created_at_date': dt.now().strftime("%m/%d/%Y, %H:%M:%S"),
			'created_at_date_as_str': dt.now().strftime("%m/%d/%Y"),
			
			'auth_id': params.get('auth_id', None),
			'user_email': params.get('user_email', None),
			'data': params.get('data', None),
			'used_hash': params.get('used_hash', None)
		}
		return obj, trans_id

class controller_auth_resp(object):
	def __init__(self):
		self.domain = auth_resp()
	
	def _q(self):
		return mongo_client.local_spd[ self.domain.__class__.__name__ ]
	
	def save_transaction(self, auth_resp_as_json, email, _hash, _auth_id):
		obj, _id = self.domain.map({
			'authorize_resp': auth_resp_as_json,
			'user_email': email,
			'data': auth_resp_as_json,
			'hash': _hash,
			'auth_id': _auth_id
		})

		insert = self._q().insert_one( obj )
		
		if insert.acknowledged:
			return insert.acknowledged, str(_id), str(_auth_id)
		else:
			return False, False, False

# ----------------------------------------------------------
# ! MemberShips !
class membership(object):
	def __init__(self):
		self.attrs = {}

	def meta_drop(self, values):
		_ = {
			'is_logged_in': None,
			'membership_id': None,
			'is_self_admin': None,
			'is_group_admin': None
		}
		return filter(lambda i: i not in _.keys(), values)

	def map(self, params):
		return {
			'_id': params.get('_id', uuid.uuid4()),
			'created_at_utc': dt.now(tz=timezone.utc),
			'created_at_datetime': dt.now(),
			'created_at_date': dt.now().strftime("%m/%d/%Y, %H:%M:%S"),
			'created_at_date_as_str': dt.now().strftime("%Y/%m/%d/"),

			'name': params.get('group_name', None),
			'password': params.get('group_password', None),
			'transaction_authorize_id': params.get('auth_id', None),
			'transaction_id': params.get('trans_id', None),
			'subscription_id': params.get('sub_id', None),
			'subscription_pg_id': params.get('pg_id', None),
			'hash': params.get('hash', None),

			'expires_on_as_dt': params.get('expires_on_as_dt', None),
			'expires_on_as_str': params.get('expires_on_as_str', None),
			'created_user_ids': params.get('created_user_ids', None),
			'created_user_emails': params.get('created_user_emails', None)
		}

	def values(self):
		return list(self.map({}).keys())

class controller_membership(object):
	def __init__(self):
		self.domain = membership()

	def _q(self):
		return mongo_client.local_spd[ self.domain.__class__.__name__ ]

	def delete_one(self, indent):
		return self._q().delete_one({ '_id': indent })

	def add_trans_id(self, ident):
		return self._q().update_one({ '_id': ident })

	def is_current(self, ident):
		memb = self._q().find_one({ '_id': ident })
		return memb['created_at_datetime'] <= dt.now() <= memb['expires_on_as_dt']

	def days_remaining(self, ident):
		memb = self._q().find_one({ '_id': ident })
		remaining = dt.now() - memb['expires_on_as_dt']
		return str(remaining.days).replace('-','')

	def retrieve_users_for_membership(self, ident_as_str):
		pdb.set_trace()
		admin = None
		users = []
		
		memb = self._q().find_one({ '_id': uuid.UUID( ident_as_str ) })

		if memb['created_admin_id'] is not None:
			controller = controller_user()
			user = controller.get_user_by_id( memb['created_admin_id'] )
			admin = user[0]

		if memb['created_user_ids'] is not None:
			for _uuid in memb['created_user_ids']:
				controller = controller_user()
				user = controller.get_user_by_id( _uuid )
				users.append( user[0] )

		pdb.set_trace()
		return admin, users

	def create(self, params):
		control_sub = controller_subscriptions()

		pdb.set_trace()

		sub = control_sub.look_up( int(params['pg_id']), uuid.UUID(params['sub_id']))

		days = sub['calendar_days']
		today = dt.today()
		expires = today + delt(days=days)

		params['expires_on_as_dt'] = expires
		params['expires_on_as_str'] = expires.strftime("%Y/%m/%d/")

		new_memb = self._q().insert_one(
			self.domain.map( params )
		)
		return new_memb.acknowledged, new_memb.inserted_id

	def check_memb_obj(self, group_name, group_password):
		message = 'Need A Unique Group Name And Password'

		group = list( self._q().find({ 'name': group_name }))
		pswd = list( self._q().find({ 'password': group_password }))

		if len(group) > 0:
			message = 'This group name exists already'
			return False, message, { 'group_name':  group_name, 'group_password':  group_password }
		
		if len(pswd) > 0:
			message = 'This group Password exists already'
			return False, message, { 'group_name':  group_name, 'group_password':  group_password }
		
		if  group_name == '' or  group_name is None:
			return False, message
		
		if  group_password == '' or  group_password is None:
			return False, message
		
		return True, message, {} 

	def associate(self, memb_id, admin_id, user_ids):
		return self._q().update( 
			{ '_id': memb_id },
			{ '$set': {'created_user_ids': user_ids, 'created_admin_id': admin_id } }
		)

# ----------------------------------------------------------
# ! Users !
class user(object):
	def __init__(self, as_user=None):
		self.attrs = {}
		self.as_user = as_user

	def map(self, params):
		return {
			'_id': params.get('_id', None),
			'Email': params.get('Email', None),
			'Password': params.get('Password', None),
			'First_Name': params.get('First_Name', None),
			'Last_Name': params.get('Last_Name', None),
			'Company_Name': params.get('Company_Name', None),
			'Company_Title': params.get('Company_Title', None),
			'Years_Of_Experience': params.get('Years_Of_Experience', None),
			'Group_Name': params.get('Group_Name', None),
			'Group_Password': params.get('Group_Password', None),

			'belongs_group': params.get('belongs_group', False), 
			'first_access': params.get('first_access', True),
			'is_logged_in': params.get('is_logged_in', False),
			'membership_id': params.get('membership', None),
			
			'is_self_admin': params.get('is_self_admin', True),
			'is_group_admin': params.get('is_group_admin', False)
		}

	def web_meta_drop(self, values):
		_ = {
			'belongs_group': None,
			'first_access': None,

			'is_logged_in': None,
			'membership_id': None,
			
			'is_self_admin': None,
			'is_group_admin': None
		}
		return filter( lambda i: i not in _.keys(), values )

	def web_values(self):
		return self.web_meta_drop( list( self.map({}).keys() ) )

class controller_user(object):
	def __init__(self):
		self.domain = user()
		self.memb_control = controller_membership()
		self.sub_control = controller_subscriptions()

	def _q(self):
		return mongo_client.local_spd[ self.domain.__class__.__name__ ]

	def delete_many(self, ids_as_array):
		return self._q().delete_many({ '_id': { '$IN': ids_as_array } })

	def delete_one(self, indent):
		return self._q().delete_one({ '_id': indent })

	def create_group_admin_user(self, params):
		indent = uuid.uuid4()
		params['_id'] = indent
		params['is_self_admin'] = True
		params['is_group_admin'] = True

		obj = {}
		for k,v in params.items():
			if ' ' in k:
				new = k.replace(' ', '_')
				obj[new] = v
			else:
				obj[k] = v

		pdb.set_trace()

		new_group_admin_user = self._q().insert_one( 
			self.domain.map( obj ) 
		)
		return new_group_admin_user.acknowledged, new_group_admin_user.inserted_id
		

	def create_user(self, params):
		indent = uuid.uuid4()
		params['_id'] = indent
		params['is_self_admin'] = True
		params['is_group_admin'] = False

		obj = {}
		for k,v in params.items():
			if ' ' in k:
				new = k.replace(' ', '_')
				obj[new] = v
			else:
				obj[k] = v

		pdb.set_trace()
		
		new_user = self._q().insert_one( 
			self.domain.map( obj ) 
		)
		return new_user.acknowledged, new_user.inserted_id

	def get_user_by_id(self, ident):
		return list( self._q().find(
			{ '_id': ident },
			{
				'Email': 1,
			    'Password': 1,
			    'First_Name': 1,
			    'Last_Name': 1,
			    'Company_Name': 1,
			    'Company_Title' : 1,
			    'Years_Of_Experience': 1,
			    'Group_Name': 1,
			    'Group_Password': 1
		    }
		 ))

	def user_search(self, attr, value):
		return [ self._q().find({ attr: value }) ]

	def get_user_info_by_email(self, email):
		return [ self._q().find_one({ 'Email': email }) ]

	def users_by_membership(self, indet):
		return [ self._q().find({ 'membership_id': ident }) ]

	def users_by_group_name(self, name):
		return [ self._q().find({ 'Group_Name': name }) ] 

	def loggout(self, email): 
		self._q().update_one( { 'Email': email }, { '$set': { 'is_logged_in': False  } } )

	def get_view_meta(self, email):
		user = list( self._q().find({ 'Email': email } ) )
		memb = list( self.memb_control._q().find({ '_id': user[0]['membership_id'] }) )
		subscription = list( self.sub_control._q().find({ '_id': UUID(memb[0]['subscription_id'])  }) ) 

		records = subscription[0]['Records_id']
		access = subscription[0]['access_type']
		memb_id = memb[0]['_id']
		
		if records == 'Entire DB':
			records = '*'
		else:
			records = int(records)
		pdb.set_trace()
		
		return records, access, memb_id, user[0]['is_group_admin']


	def first_time_login(self, email):
		try:
			self._q().update( 
				{ 'Email': email }, 
				{ '$set': { 
					'is_logged_in': True, 
					'first_access': False 
				} 
			})
			return True, email
		except:
			return False, email

	def loggin(self, email):
		try:
			self._q().update_one( 
				{ 'Email': email }, 
				{ '$set': { 'is_logged_in': True } }
			)
			return True, email
		except:
			return False, email

	def loggin_first_access_group(self, email, password, group_name, group_password):
		# project = { k:1 for k in self.domain.web_values() }
		_logged_in = False
		_email = email
		_user = {
			'Email': email,
			'Password': password,
			'Group_Name': group_name,
			'Group_Password': group_password
		}
		# user = list( self._q().find_one( _user, project ))
		user = list( self._q().find( _user ))
		if len(user) == 1:
			_logged_in, _email = self.first_time_login( user[0]['Email'] )
		return _logged_in, _user, _email


	def check_user_obj(self, email, password):
		message = 'Need A Unique User Name And Password'

		user_email = list( self._q().find({ 'Email': email }))
		user_pswd = list( self._q().find({ 'Password': password }))

		if len(user_email) > 0:
			message = 'User Email Already Exists'
			return False, message, { 'Email': email, 'Password': password }
		
		if len(user_pswd) > 0:
			message = 'User Password Already Exists'
			return False, message, { 'Email': email, 'Password': password }
		
		if password == '' or password is None:
			return False, message, None
		
		if email == '' or email is None:
			return False, message, None

		return True, message, None


	def _as_is(self, email=None, ident=None):
		_user = self._q().find_one({
			'$OR': { 'Email': email, '_id': ident }
		})
		if _user is None:
			return False
		else:
			return True 

	# def is_member(self)
	# 	return self._q.find()














































