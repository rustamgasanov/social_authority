# Social Authority Ruby Gem

A Ruby interface to the Social Authority API.

## Installation
    gem install social_authority

## Usage Examples

Get your access credentials after registration on https://followerwonk.com/social-authority

```ruby
require 'social_authority'

client = SocialAuthority::Client.new('YOUR_ACCESS_ID', 'YOUR_SECRET_KEY')

```
**Fetch by user_id(s):**
```ruby
client.fetch_user_ids(['74594552', '10671602'])
```
**Fetch by screen_name(s):**
```ruby
client.fetch_screen_names(['Porsche', 'Toyota'])
```
**Fetch by user_id(s) AND screen_name(s), note the order of arguments:**
```ruby
client.fetch(['74594552', '10671602'], ['Porsche', 'Toyota'])
```


