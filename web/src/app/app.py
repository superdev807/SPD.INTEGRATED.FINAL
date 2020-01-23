import os, sys, argparse, pprint, argparse, pdb

from flask import Flask

from urls import ENDPOINTS as domains

# sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
# from lib.db_briefcase.db import SESSION


# import pprint as pp; _ = pp.PrettyPrinter(indent=4); _.pprint( dir( app ) )


# app = Flask(__name__)
# app = Flask(__name__, static_url_path='/static/build')

app = Flask(__name__, static_folder = './static', template_folder="./static")
# app = Flask(__name__, static_folder = './static')




# pdb.set_trace()

# return Bundled JSX/React
@app.route("/")
def index():
	# return "This is Application Index -- Will Serve React From Here !"
    # return app.send_static_file('index.html')
    return send_from_directory(app.static_folder, 'index.html')

@app.route("/test")
def test():
	return "Oh, hello world! What A Wonderful Test!"

# -- register blueprints
print('-----------------------')
print('{{ Registering Blueprints ... }}')
for domain, endpoint in domains.items():
	app.register_blueprint(endpoint, url_prefix=domain)
print('{{ Blueprints Regstered! }}')

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Run Time Commands For Web App')
	
	parser.add_argument(
    		'--debug',
            required=False,
            type=bool,
            help='[True] or [False]',
            default=False)
	parser.add_argument(
	    	'--show',
	    	required=False,
	        type=str,
	        help='List Endpoints?',
	        default=None)
	parsed_args = parser.parse_args()

	if parsed_args.show == 'endpoints':
		print('-----------------------')
		print('{{ -- SHOWING ENDPOINTS ::')
		print('\n Display Routes ::')
		pp = pprint.PrettyPrinter(indent=4)
		pp.pprint(['%s' % rule for rule in app.url_map.iter_rules()])
	else:
		print('{{ -- NOT! SHOWING ENDPOINTS ::')
	if parsed_args.debug:
		print('{{ -- Using Development Mode }}')
		app.run(port=5000, debug=True)
	else: 
		print('{{ -- NOT Development Mode }}')
		app.run(port=5000)