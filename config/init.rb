require 'rubygems'
require 'lokii'

# Only option currently is :database
Lokii::Config.setup do |config|
  config.options[:database] = false
end

# Lokii won't do anything unless a server is activated. By default it comes with
# two servers: database_server and file_server. These are simple servers that
# implement the checking, processing and saying, either through a database 
# (which can be used in conjunction with gnokii/smsd and others) or through 
# a watched directory.
require 'lokii/servers/gsm_server'

# Register the server with the processor
Lokii::Processor.servers = Lokii::GsmServer.new

# Once you have selected a server you need to register the appropriate handlers
# By example a PingHandler and ILoveYouHandler are registered. Handlers are
# ordered, when processing a message the server will give each handler an
# opportunity to handle it in order (unless a handler issues a halt). If you 
# assign handlers to the processor, it will register the handlers with all
# available servers. If you want more fine-grained control, register the 
# handlers on the server instance itself.
Lokii::Processor.handlers = PingHandler.new, ILoveYouHandler.new 
