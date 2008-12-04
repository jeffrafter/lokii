module Lokii
  class Handler
    attr_accessor :message, :worker, :server
        
    def initialize
      @message = nil
      @worker = nil
      @server = nil
    end

    def handle(message, worker, server)
      @message = message
      @worker = worker      
      @server = server
      process 
    end
      
    def process
      raise NotImplementedError
    end
    
    def complete
      @server.complete(message)
    end

    def reply(text)
      Lokii::Logger.debug "Sending reply to #{message.number}"
      @server.say(text, message.number, message.id)
    end
    
    def halt
      throw :halt
    end
  end
end  