require 'rubygems'
require 'test/unit'
require 'spec'

ENV["RSPEC"] = "true"
ENV["AUTOTEST"] = "true"

LOKII_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')) unless defined? LOKII_ROOT
LOKII_ENV = 'test' unless defined? LOKII_ENV

if File.exist?(File.join(LOKII_ROOT, 'lib', 'lokii.rb'))
  $:.unshift(File.join(LOKII_ROOT, 'lib'))
  $:.unshift(File.join(LOKII_ROOT, 'spec', '**', '*_spec.rb'))
end

require 'lokii'

# Load custom matchers
Dir[File.expand_path("#{File.dirname(__FILE__)}/matchers/*.rb")].uniq.each do |file|
  require file
end

alias :running :lambda

Spec::Runner.configure do |config|
end

def message(text, number=nil)
  Inbox.new(:text => text, :number => number)
end