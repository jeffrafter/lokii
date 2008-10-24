require 'rubygems'
require 'active_record'
require 'active_support'

require 'lokii/support'
require 'lokii/logger'
require 'lokii/config'
require 'lokii/server'
require 'lokii/handler'

Lokii::Config.setup
raise "Already running, aborting (existing pid file found at #{Lokii::Config.pid})" if Lokii::Server.running?

Lokii::Server.setup