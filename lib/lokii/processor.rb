module Lokii
  class Processor       
    def self.process
      # Make sure it is not stopped and that we started it
      return if self.stopped?     
      return unless self.running?
      if Lokii::Config.verbose
        Lokii::Logger.debug ""
        Lokii::Logger.debug "Processing #{Time.now}"
      end  
      catch :halt do
        self.servers.each {|server|
          server.process
        }
      end  
    end
    
    def self.servers
      @servers ||= []
      @servers
    end
    
    def self.hanlders
      @hanlders ||= []
      @handlers
    end
    
    def self.servers=(*args)
      arr = args.first if args.first.is_a?(Array)
      arr ||= args
      @servers = arr
    end
    
    def self.handlers=(*args)
      arr = args.first if args.first.is_a?(Array)
      arr ||= args
      @handlers = arr
      self.servers.each { |server|
        server.handlers = @handlers
      }
    end
            
    def self.stopped?
      defined?(@@stopped) && @@stopped
    end   
       
    def self.running?
      File.exist?(File.join(Lokii::Config.root, Lokii::Config.pid).gsub(File::SEPARATOR, File::ALT_SEPARATOR || File::SEPARATOR))
    end
    
    def self.daemon?
      defined?(LOKII_DAEMON) && LOKII_DAEMON
    end  
  end
end