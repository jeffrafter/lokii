ENV['LOKII_ENV'] = 'test'

require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'

require 'lokii'
require 'lokii/test'
require 'boot'

Lokii::Config.setup do |config|
  config.options[:database] = false
end