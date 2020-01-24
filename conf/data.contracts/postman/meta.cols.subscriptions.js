var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/spd/meta',
  headers: 
   { 'Postman-Token': '46565bb5-d7eb-407b-88d8-e346bb44c006',
     'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: { type: 'subscript-cols' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
