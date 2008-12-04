require 'rubygems'
require 'active_record'
require 'active_support'

$:.unshift(File.expand_path(File.dirname(__FILE__)))

require 'lokii/logger'
require 'lokii/config'
require 'lokii/server'
require 'lokii/handler'