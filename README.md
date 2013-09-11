# MailRu

Ruby client library for the [mailru REST API](http://api.mail.ru/docs/guides/restapi/).

## Installation

Add this line to your application's Gemfile:

    gem 'mailru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mailru

## Usage

MailRu gem allow use any mailru REST API methods by ruby way

    MailRu.app_id = APP_ID
    MailRu.secret_key = SECRET_KEY
    rest = MailRu::Session.new
   
    rest.stream_get_by_author(uid: uid)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
