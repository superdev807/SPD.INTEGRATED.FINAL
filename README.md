# Speciality Pharmacy Database

### backend dependencies

* located at:
	* `web/src/`

* python dependencies:
	* `python3.6+`
	* `pip3`

	* installs
		* `brew install python3`
		* ( from project root )
			* `python3 -m venv env_spd`
				* call michael is this does not work smoothly
			* `pip3 install -r env-all-requirements.txt`

	* `mongo community 3.4`
		* `brew tap mongodb/brew`
		* `brew install mongodb/brew/mongodb-community@3.4`

	* populate [ subscriptions ] and [ pharmacies ] tables 
		* from: `conf/mogno/backups`
			* let michael know if there issues

### stand up backend

* ( from project root )
* `source env-all/bin/activate`
* `cd web/src/app`
* `python app.py --show endpoints`


### front-end

* located at:
	* `web/static`

