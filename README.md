# Hatchet Hipchat

A HipChat appender for [Hatchet](http://gshutler.github.com/hatchet/).

[![Build Status](https://secure.travis-ci.org/gshutler/hatchet-hipchat.png?branch=master)](http://travis-ci.org/gshutler/hatchet-hipchat)

## Installation

Add this line to your application's Gemfile:

    gem 'hatchet-hipchat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hatchet-hipchat

## Usage

```ruby
Hatchet.configure do |config|
  config.appenders << Hatchet::HipChatAppender.new do |appender|
    appender.api_token = 'YOUR_HIPCHAT_API_TOKEN'
    appender.room_id   = 'YOUR_ROOM_ID'
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
