module Lokii
  class Server
    attr_accessor :stopped, :ready, :handlers          
       
    def ready?
      defined?(@ready) && @ready
    end   
       
    def stopped?
      defined?(@stopped) && @stopped
    end   
       
    def setup
      self.ready = true
      Lokii::Logger.debug "Initializing"
      Lokii::Logger.debug "Waiting for text messages"
    end
    
    def process
      # Make sure it is not stopped and that we started it
      return if stopped?     
      return unless running?
      setup unless ready?
      check
    end
            
    def running?
      File.exist?(File.join(Lokii::Config.root, Lokii::Config.pid))
    end
    
    def daemon?
      defined?(LOKII_DAEMON) && LOKII_DAEMON
    end  
    
    def connect
      Lokii::Logger.debug "Connecting"
    end      
                
    def disconnect
      Lokii::Logger.debug "Disconnecting"
    end      

    def say(text, number, reply = nil)
      Lokii::Logger.debug "Sending message to #{number}" 
    end
    
    def complete(message)
      Lokii::Logger.debug "Message processing complete" if Lokii::Config.verbose
    end    
  
    def check
      Lokii::Logger.debug "Checking for incoming messages" if Lokii::Config.verbose
    end
    
  private

    def handle(message)        
      Lokii::Logger.debug "\nHandling message"
      Lokii::Logger.debug ":sender: #{message[:number]}"
      Lokii::Logger.debug ":sent: #{message[:created_at]}"
      Lokii::Logger.debug ":received: #{message[:processed_at]}"
      Lokii::Logger.debug ":text: #{message[:text]}"
      catch :halt do
        handlers.each {|handler|
          handler.handle(message, self)
        }
      end  
      complete(message) unless message[:processed]
    end
    
  end
end