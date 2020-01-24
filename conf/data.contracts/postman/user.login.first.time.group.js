var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/auth/login',
  headers: 
   { 'Postman-Token': '82d0c040-3b2f-49d1-8adf-eab1074941b5',
     'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: 
   { Email: 'Fishmshman.com',
     Password: 'dsfsdfds',
     Group_Name: 'Philly.Group!',
     Group_Password: 'Philly.Group!.password',
     'first-time-group': true },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});