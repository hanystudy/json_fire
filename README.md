# json_fire

json_fire can help you send JSON data to anywhere.

Usage
-----

ruby ./fire.rb [RESTful uri] [JSON file location]

e.g.

```ruby
ruby ./fire.rb 'http://localhost:3000/api/test' './files/users.json'
```

Configuration
-------------

All configurations can be found in files/host_setting.json, currently support:

### OAuth 1.0a signature
{
  "consumer_key": "fake key",
  "consumer_secret": "fake secret"
}
