require 'logger'

module Lokii
  class Logger    

    cattr_accessor :logger
    
    class << self
      
      def setup
        $stdout.reopen(File.open(File.join(Lokii::Config.root, Lokii::Config.log), "a")) if daemon?
        $stderr.reopen(File.open(File.join(Lokii::Config.root, Lokii::Config.err), "a")) if daemon?
        self.logger ||= ::Logger.new(Lokii::Config.log && !daemon? ? File.join(Lokii::Config.root, Lokii::Config.log) : STDOUT)
      end
      
      def method_missing(name, *args, &blk)
        self.setup  
        self.logger.send(name, *args, &blk)
        puts(*args) unless daemon?
      end
    
      def daemon?
        defined?(LOKII_DAEMON) && LOKII_DAEMON
      end
      
    end
    
  end
end