require File.join('lokii', 'models', 'inbox')
require File.join('lokii', 'models', 'multipart_inbox')
require File.join('lokii', 'models', 'outbox')

module Lokii
  class Server
    def self.check
      messages = Inbox.pending.find(:all)
      messages.each {|message|
        self.handle(message)    
      }      
    end

    def self.complete(message)
      message.processed = 1
      message.save!
    end    

    def self.say(text, number, reply = nil)
      Outbox.create(:text => text, :number => number, :reply => reply)
    end
  end  
end