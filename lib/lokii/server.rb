module Lokii
  class Server
    cattr_accessor :stopped, :ready, :handlers          
       
    def self.setup
      self.ready = true
      Lokii::Logger.debug "Initializing"
      Lokii::Logger.debug "Waiting for text messages"
    end
    
    def self.process
      # Make sure it is not stopped and that we started it
      return if self.stopped     
      return unless self.running?
      self.setup unless self.ready
      if Lokii::Config.verbose
        Lokii::Logger.debug ""
        Lokii::Logger.debug "Processing #{Time.now}"
      end  
      self.check
    end
            
    def self.running?
      File.exist?(File.join(Lokii::Config.root, Lokii::Config.pid))
    end
    
    def self.daemon?
      defined?(LOKII_DAEMON) && LOKII_DAEMON
    end  
    
    def self.connect
      Lokii::Logger.debug "Connecting"
    end      
                
    def self.disconnect
      Lokii::Logger.debug "Disconnecting"
    end      

    def self.say(text, number)
      Lokii::Logger.debug "Sending message to #{number}" 
    end
    
    def self.complete(message)
      Lokii::Logger.debug "Message processing complete" if Lokii::Config.verbose
    end    
  
    def self.check
      Lokii::Logger.debug "Checking for incoming messages" if Lokii::Config.verbose
    end
    
  private

    def self.handle(message)
      message = message
      worker = Worker.active.find(:first, :conditions => {:number => message.number})
      return unless worker
      Lokii::Logger.debug ""
      Lokii::Logger.debug "Handling message\n#{message.to_yaml}"
      self.handlers.each {|handler|
        handler.handle(message, worker)
        break if message.processed > 0
      }
      self.complete(message) unless message.processed?
    end
    
  end
end