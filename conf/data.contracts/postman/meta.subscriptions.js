var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/spd/meta',
  headers: 
   { 'Postman-Token': '5956edb7-794c-4006-96f3-d411c822917a',
     'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: { type: 'subscript-meta' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
