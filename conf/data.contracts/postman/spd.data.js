var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/spd/data',
  headers: 
   { 'Postman-Token': 'b5f02a5f-9eee-4d20-9d2b-5558d21f5fcc',
     'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: { email: 'Ben Simmons', access: 'Basic', records: '*' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
