ENV['LOKII_ENV'] = 'test'

require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'

require File.join(File.dirname(__FILE__), '..', 'config', 'boot')
require 'lokii/test'