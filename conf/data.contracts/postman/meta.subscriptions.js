var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/spd/meta',
  headers: 
   { 'Postman-Token': '2606b089-b0d1-4440-b12b-5be7f38527ec',
     'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: { type: 'subscript-meta' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
