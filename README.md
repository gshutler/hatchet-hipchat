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
    appender.name      = 'MESSAGING_NAME' # Optional - defaults to 'Hatchet'
  end
end
```

## Emoticon formatter

And if you're rage inclined (like me), there's a `HipChatEmoticonFormatter` you
can use to replace levels with rage faces:

```ruby
Hatchet.configure do |config|
  config.appenders << Hatchet::HipChatAppender.new do |appender|
    appender.formatter = Hatchet::HipChatEmoticonFormatter.new
    # Other configuration
  end
end
```

### Mapping

 * `:debug` is ![Content](https://dujrsrsgsd3nh.cloudfront.net/img/emoticons/content.png)
 * `:info` is ![Wat](https://dujrsrsgsd3nh.cloudfront.net/img/emoticons/wat.png)
 * `:warn` is ![Oh crap](https://dujrsrsgsd3nh.cloudfront.net/img/emoticons/ohcrap.png)
 * `:error` is ![Oh my god](https://dujrsrsgsd3nh.cloudfront.net/img/emoticons/omg.png)
 * `:fatal` is ![Boom](https://dujrsrsgsd3nh.cloudfront.net/img/emoticons/boom.gif)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
