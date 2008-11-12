require 'rubygems'

require 'test/unit'
require 'context'
require 'matchy'
require 'stump'

LOKII_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')) unless defined? LOKII_ROOT
LOKII_ENV = 'test' unless defined? LOKII_ENV

if File.exist?(File.join(LOKII_ROOT, 'lib', 'lokii.rb'))
  $:.unshift(File.join(LOKII_ROOT, 'lib'))
end

require 'lokii'

# Load custom expectations
Dir[File.expand_path(File.join(LOKII_ROOT, 'test', 'expectations', '*.rb'))].uniq.each do |file|
  require file
end

alias :running :lambda

class Test::Unit::TestCase
  #self.use_transactional_fixtures = true
  #self.use_instantiated_fixtures  = false
end

Dir[File.expand_path(File.join(LOKII_ROOT, 'test', '**', '*_test.rb'))].uniq.each do |file|
  require file
end


def message(text, number=nil)
  Inbox.new(:text => text, :number => number)
end