LOKII_ENV = 'test' unless defined? LOKII_ENV

require 'rubygems'
require 'lokii'
require 'test/unit'
require 'shoulda'

require 'lokii/servers/memory_server'

# Customize your test environment by altering this
class Test::Unit::TestCase

  def setup
    @server = Lokii::MemoryServer.new
    Lokii::Processor.servers = @server
  end

  def incoming(text, number = "+123456789", sent = Time.now)
    @server.receive(text, number, sent)
  end

  def outgoing
    @server.outbox
  end

end
