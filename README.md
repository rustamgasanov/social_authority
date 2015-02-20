# Social Authority Ruby Gem

A Ruby interface to the Social Authority API.

## Installation
    gem install social_authority

## Usage Examples

Get your access credentials after registration on https://followerwonk.com/social-authority

```ruby
require 'social_authority'

client = SocialAuthority::Client.new('YOUR_ACCESS_ID', 'YOUR_SECRET_KEY')

# fetch by user_id(s):
client.fetch_user_ids(['74594552', '10671602'])

# fetch by screen_name(s):
client.fetch_screen_names(['Porsche', 'Toyota'])

#fetch by user_id(s) AND screen_name(s), note the order of arguments:
client.fetch(['74594552', '10671602'], ['Porsche', 'Toyota'])


