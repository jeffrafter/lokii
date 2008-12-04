require 'lokii'

Lokii::Config.setup
Lokii::Server.stopped = false
Lokii::Server.ready = false
Lokii::Server.handlers ||= [ PingHandler.new, ILoveYouHandler.new ]    