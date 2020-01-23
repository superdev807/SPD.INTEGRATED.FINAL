var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/spd/data',
  headers: 
   { 'Content-Type': 'application/json' },
  body: { email: 'Ben Simmons', access: 'Basic', records: '*' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
