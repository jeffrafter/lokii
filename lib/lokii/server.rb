module Lokii
  class Server
    cattr_accessor :stopped, :started, :ready
      
    def self.setup
#      self.started = false
#      self.stopped = false
#      self.ready = false
      File.open(File.join(Lokii::Config.root, Lokii::Config.pid), "w") 
      Lokii::Logger.debug ""
      Lokii::Logger.debug "Initializing"
      # More setup code here
    end
    
    def self.process
      return if self.stopped
      self.setup unless self.running? 
      self.started = true
      Lokii::Logger.debug "Processing #{Time.now}"
      # More processing code here
    end
    
    def self.teardown
      return unless self.running? 
      self.stopped = true
      File.delete(File.join(Lokii::Config.root, Lokii::Config.pid))
      Lokii::Logger.debug "Closing connections"
      # More teardown code here
    end
        
    def self.running?
      File.exist?(File.join(Lokii::Config.root, Lokii::Config.pid))
    end
    
    def self.daemon?
      defined?(LOKII_DAEMON) && LOKII_DAEMON
    end    
  end
end