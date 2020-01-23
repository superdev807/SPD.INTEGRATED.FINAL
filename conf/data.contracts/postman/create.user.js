var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/auth/create',
  headers: 
   { 'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: 
   { hash: 'dsgfsfdfdsfds',
     trans_id: '2118ba40-21bc-4a76-a8fa-bab5a6b42709',
     auth_id: 'adfadfsdfdsfg',
     sub_id: '74f7c31c-4d81-4dbd-8397-c94a4a6675ec',
     pg_id: '6',
     type: 'single',
     group_name: 'bbbbbbbb',
     group_password: 'dghdgdghghdghdg',
     user: 
      { Email: 'Ty@trey.com',
        Password: '15555551',
        'First Name': 'Trey',
        'Last Name': 'Trey',
        'Company Name': 'Trey',
        'Company Title': 'Trey',
        'Years Of Experience': 3 },
     test: true },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
