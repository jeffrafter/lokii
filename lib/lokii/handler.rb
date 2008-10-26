module Lokii
  class Handler

    attr_reader :message
    
    def initialize
      @message = nil
      @worker = nil
    end

    def handle(message, worker)
      @message = message
      @worker = worker      
      process unless @message.processed?
    end
      
    def process
      raise NotImplementedError.new
    end
    
    def complete
      Lokii::Logger.debug "Message processing complete"
      message.processed = 1
      message.save!
    end

    def reply(text)
      Lokii::Logger.debug "Sending reply to #{message.number}"
      Lokii::Server.say(text, message.number)
    end
    
  end
end  