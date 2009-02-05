LOKII_ENV = 'test' unless defined? LOKII_ENV

require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'config', 'boot.rb')
require 'test/unit'
require 'shoulda'

class Test::Unit::TestCase
  # self.use_transactional_fixtures = true
  # self.use_instantiated_fixtures  = false

  def message(text, number=nil)
    Inbox.new(:text => text, :number => number)
  end
end
