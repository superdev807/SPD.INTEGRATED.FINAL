# Speciality Pharmacy Database


### backend dependencies

* located at:
	* `web/src/`

* python dependencies:
	* `python3.6+`
	* `pip3`
	* `venv`

	* installs
		* `brew install python3`
		* `sudo easy_install pip`
			* might want to investigate best way to do this in your current config
		* (sudo) pip3 install venv
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

* postgres
	* brew install postgresql@10

* useful brew commands
	* installed services
		* `brew services list`

	* engage services:
		* `brew services [restart][stop][start] [service-name-as-listed-in-list]`

		* examples: 
			* `brew install mongodb/brew/mongodb-community@3.4`
			* `brew services start postgresql@10`
			

### stand up backend

* ( from project root )
* `source env-all/bin/activate`
* `cd web/src/app`
* `python app.py --show endpoints`



### front-end

* located at:
	* `web/static`

