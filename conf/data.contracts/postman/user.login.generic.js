var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/auth/login',
  headers: 
   { 'Content-Type': 'application/json' },
  body: { Email: 'Fishmshman.com', Password: 'dsfsdfds' },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
