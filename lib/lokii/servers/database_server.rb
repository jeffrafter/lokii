module Lokii
  class Server
    class << self
      def check
        messages = Inbox.pending.find(:all)
        messages.each {|message|
          self.handle(message)    
        }      
      end

      def complete(message)
        message.processed = 1
        message.save!
      end    

      def say(text, number)
        Outbox.create(:text => text, :number => number)
      end
    end
  end  
end