require 'rubygems'
require 'active_record'
require 'active_support'

require 'lokii/logger'
require 'lokii/config'
require 'lokii/server'
require 'lokii/handler'

Lokii::Config.setup
Lokii::Server.stopped = false
Lokii::Server.ready = false
Lokii::Server.handlers ||= [ PongHandler.new, ILoveYouHandler.new ]    