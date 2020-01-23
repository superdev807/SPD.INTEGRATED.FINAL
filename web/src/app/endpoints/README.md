## API FLOWS

#### Display / Retrieve

# ------------------------------------------------------
# ^^^ POSTMAN
* Load Meta Data --
	* `GET /api/v1/spd/meta`
		* Provide `type` 
			* [$$] `trans-hash` 
				* Accept 
					* ''
			* [$$] `user-search` 
				* Accept 
					* [ '', '' ]
			* [##] `user-meta` || '<email>' 
				* Accept 
					* {}
			* [$$] `subscript-cols` 
				* Accept 
					*  [ '', '' ]
			* [##] `subscript-meta` 
				* Accept 
					*  [ {}, {} ]
			* [$$] `records-cols`
				* Accept 
					*  [ '','' ]
			* [$$] `records-meta` 
				* Accept 
					*  [ {}, {} ]

# ------------------------------------------------------
# ^^^ POSTMAN
# ^^^ NOT TESTED	
* User Info
	* `GET /api/v1/auth/user`
		* Provide 
			* `email` 
			* `membership_id` 
		* Accept
			* if is admin
				* membership
				* all users for membership
				* self
			* else
				* self
				* memembership

# ------------------------------------------------------
# ^^^ POSTMAN
# ^^^ TESTED
#### NEW USERS
* USER CHOOSES PLAN
* Fills Out Form 
	Membership 
	Single
* Processes Payment for Authorize sour
	* On Fail - 
		* Prompt them with module Window
		* option to go back to creat page
	
	* On Success - 
		* `POST /api/v1/transaction/completed`
		* `POST /api/v1/subscriptions/_create`
			* provide 
				* subscription id
				* membership
				* admin / users

			* backend
				* check 
					* passes unique -for user in users, 
					* passes unique - admin_user 
					* passes unique - membership

				* create membership id
				* create admin user
				* create users 

				* associate membersip to all

		* on success
			* redirect to login page

#### ACCESS

# ------------------------------------------------------
# ^^^
* Login 
	* `GET /api/v1/auth/login`
		* provide
			* email, password
			* if group, is first time log in: 
				* group password
				* user password
				* email
		* retrieve
			* is group 
			* subscription type, name
			* Date: Subscription End

# ------------------------------------------------------
# ^^^
* Get Data
	* provide
		* subscript type
		* user email
	* Accept
		* `{ 'data' : [ { col: val, col: val } , { col: val, col: val } ]}`