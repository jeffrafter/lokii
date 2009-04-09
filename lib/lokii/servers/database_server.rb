require File.join('lokii', 'models', 'inbox')
require File.join('lokii', 'models', 'multipart_inbox')
require File.join('lokii', 'models', 'outbox')

module Lokii
  class DatabaseServer < Server
    def check
      messages = Inbox.pending.find(:all)
      messages.each {|message|
        handle {:phone => message.phone,
                :number => message.number,
                :text => message.text,
                :created_at => message.insertdate,
                :processed_at => Time.now}
      }      
    end

    def complete(message)
      message.processed = 1
      message.save!
    end    

    def say(text, number, reply = nil)
      Outbox.create(:text => text, :number => number, :reply => reply)
    end
  end  
end