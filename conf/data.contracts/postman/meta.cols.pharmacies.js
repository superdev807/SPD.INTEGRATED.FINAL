var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/spd/meta',
  headers: 
   { 'Postman-Token': 'a3e60521-83ba-4369-bea5-de2f012f4685',
     'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: { type: 'records-cols' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
