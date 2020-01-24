var request = require("request");

var options = { method: 'POST',
  url: 'http://localhost:5000/api/v1/auth/create',
  headers: 
   { 'Postman-Token': '5377f1dd-4354-43cf-ab4e-76dd83bf8038',
     'cache-control': 'no-cache',
     'Content-Type': 'application/json' },
  body: 
   { hash: 'dsgfsfdfdsfds',
     trans_id: '2118ba40-21bc-4a76-a8fa-bab5a6b42709',
     auth_id: 'adfadfsdfdsfg',
     sub_id: '4980d0e4-40ac-4e28-b902-e16363f34095',
     pg_id: '2',
     type: 'multi',
     group_name: 'Philly.Group!',
     group_password: 'Philly.Group!.password',
     admin_user: 
      { Email: 'sadfasasdsd.m',
        Password: '100gfdsf',
        'First Name': 'Mike',
        'Last Name': 'Mike',
        'Company Name': 'Mike',
        'Company Title': 'Mike',
        'Years Of Experience': 3 },
     users: 
      [ { Email: 'Paige@Paigcom',
          Password: '1sdfsd',
          'First Name': 'Paige',
          'Last Name': 'Paige',
          'Company Name': 'Paige',
          'Company Title': 'Paige',
          'Years Of Experience': 3 },
        { Email: 'Fishmshman.com',
          Password: 'dsfsdfds',
          'First Name': 'Fishman',
          'Last Name': 'Fishman',
          'Company Name': 'Fishman',
          'Company Title': 'Fishman',
          'Years Of Experience': 3 },
        { Email: 'BenSimmonns.com',
          Password: '5555551',
          'First Name': 'BenSimmons',
          'Last Name': 'BenSimmons',
          'Company Name': 'BenSimmons',
          'Company Title': 'BenSimmons',
          'Years Of Experience': 3 },
        { Email: 'JoelEmbiid@JoelEmbiid.com',
          Password: '1sds1',
          'First Name': 'JoelEmbiid',
          'Last Name': 'JoelEmbiid',
          'Company Name': 'JoelEmbiid',
          'Company Title': 'JoelEmbiid',
          'Years Of Experience': 3 } ],
     test: true },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
