var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/spd/meta',
  headers: 
   { 'Content-Type': 'application/json' },
  body: { type: 'trans-hash' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
