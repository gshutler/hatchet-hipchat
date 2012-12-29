# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hatchet-hipchat/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Garry Shutler"]
  gem.email         = ["garry@robustsoftware.co.uk"]
  gem.description   = %q{Hatchet appender that sends messages to HipChat}
  gem.summary       = %q{Hatchet appender that sends messages to HipChat}
  gem.homepage      = "https://github.com/gshutler/hatchet-hipchat"

  gem.files         = Dir['{lib,spec}/**/*'] + %w{LICENSE}
  gem.test_files    = Dir['spec/**/*']
  gem.name          = "hatchet-hipchat"
  gem.require_paths = ["lib"]
  gem.version       = Hatchet::Hipchat::VERSION
  gem.add_dependency 'hatchet', '~> 0.0'
  gem.add_dependency 'hipchat-api', '~> 1.0.4'
end
