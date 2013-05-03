# Viadeo
This gem enables you to access most features of the Viadeo GRAPH API via Ruby. You'll need an access token, which you can get through Viadeo's Graph APIi. Be careful, access tokens may only be valid for about 1 Month

## Installation

Add this line to your application's Gemfile:

    gem 'viadeo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install viadeo

## Usage

### Configuration
Viadeo API requires you to authenticate via OAuth, so you'll need to
[register your application with Viadeo][register]. Once you've registered an
application, make sure to set the correct access level

[register]: http://dev.viadeo.com/documentation/authentication/request-an-api-key

Configure Viadeo parameters by passing block 
```ruby
Viadeo.configure do |config|
  config.logger = logger
  config.timeout = 30
  config.open_timeout = 30
  config.url = "https://api.viadeo.com"
end
```

### Search
Search users at paris school and limit the result to 5
```ruby
require "viadeo"
search = Viadeo::Search.new(access_token, connection: "users")
search.find(school: "paris", limit: 5)
```
Viadeo API return a JSON data which is converted to graph object
The graph object can be converted to json format 
    search.to_json


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
