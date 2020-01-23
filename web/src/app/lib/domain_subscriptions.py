class subscription(object):
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
			'Email': params.get('email', None),
			'Password': params.get('password', None),
			'First_Name': params.get('First_Name', None),
			'Last_Name': params.get('Last_Name', None),
			'Company_Name': params.get('Company_Name', None),
			'Company_Title': params.get('Company_Title', None),
			'Years_Of_Experience': params.get('Years_Of_Experience', None),
			'Group_Name': params.get('Group_Name', None),
			'Group_Password': params.get('Group_Password', None),
			'is_logged_in': params.get('is_logged_in', None),
			'membership_id': params.get('membership', None),
			'is_self_admin': params.get('is_self_admin', None),
			'is_group_admin': params.get('is_group_admin', None)
		}

	def values(self):
		return self.meta_drop( list(self.map({}).keys()) )