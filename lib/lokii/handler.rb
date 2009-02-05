module Lokii
  class Handler
    attr_accessor :message, :server
        
    def initialize
      @message = nil
      @server = nil
    end

    def handle(message, server)
      @message = message
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
      Lokii::Logger.debug "Sending reply to #{message[:number]}"
      @server.say(text, message[:number], message)
    end
    
    def halt
      throw :halt
    end
  end
end  