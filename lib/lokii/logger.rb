require 'logger'

module Lokii
  # The Lokii Logger is inteded to give a simple logging interface that can be run
  # in daemon mode or on a console. To use the logger, simply call the
  # appropriate class method (usually +debug+ or +err+):
  #
  #   Lokii::Logger.debug "I want to log this"
  #
  # When running in daemon mode the output is only
  # sent to the specified log file (and not the console). You can configure the
  # output log file in +config/settings.yml+.   
  class Logger    
    cattr_accessor :logger
    
    class << self
          
      def method_missing(name, *args, &blk)
        self.setup  
        self.logger.send(name, *args, &blk)
        puts(*args) unless daemon?
      end

      # The setup method is called for each execution. If the internal logger has
      # not been created, it will be. This method should not be called directly.
      def setup
        self.logger.reopen(File.open(File.join(Lokii::Config.root, Lokii::Config.log), "a")) if daemon? && self.logger
        self.logger ||= ::Logger.new(File.join(Lokii::Config.root, Lokii::Config.log))
      end
      
      # Checks the +LOKII_DAEMON+ constant to determine if the logger should be
      # run in daemon mode. The +LOKII_DAEMON+ constant is initialized in the
      # +script/lokii+ daemon only.
      def daemon?
        defined?(LOKII_DAEMON) && LOKII_DAEMON
      end
      
    end
    
  end
end