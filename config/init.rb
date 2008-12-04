require 'lokii'

Lokii::Config.setup

# Lokii won't do anything unless a server is activated. By default it comes with
# two servers: database_server and file_server. These are simple servers that
# implement the checking, processing and saying, either through a database 
# (which can be used in conjunction with gnokii/smsd and others) or through 
# a watched directory.
require File.join('lokii', 'servers', 'database_server')

# Once you have selected a server you need to register the appropriate handlers
# By default a PingHandler and ILoveYouHandler are registered. Handlers are
# ordered, when processing a message the server will give each handler an
# opportunity to handle it in order (unless a handler issues a halt).
Lokii::Server.handlers ||= [ PingHandler.new, ILoveYouHandler.new ]    
