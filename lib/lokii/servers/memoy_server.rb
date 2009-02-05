module Lokii

  # The memory server is a stub server that just allows you to fill an 
  # inbox and pull from an outbox. It is good as an example or as the 
  # basis of a mock server.
  class MemoryServer < Server

    # Local inbox and outbox per instance as queues
    attr_accessor :inbox, :outbox
  
    def initialize
      self.inbox = []
      self.outbox = []
    end
  
    def check
      inbox.each {|message|
        handle(message)    
      }      
    end

    def complete(message)
      inbox.delete(message)
    end    

    def say(text, number, reply = nil)
      outbox << {:text => text, :number => number, :reply => reply}
    end
  end  
end