LOKII_ENV = 'test' unless defined? LOKII_ENV

require File.join(File.dirname(__FILE__), '..', 'config', 'boot')
require 'test/unit'
require 'shoulda'

# Customize your test environment by altering this
class Test::Unit::TestCase
end
