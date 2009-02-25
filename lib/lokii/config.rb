require 'yaml'

class Hash
  def symbolize_keys!
    each do |k,v| 
      sym = k.respond_to?(:to_sym) ? k.to_sym : k 
      self[sym] = Hash === v ? v.symbolize_keys! : v 
      delete(k) unless k == sym
    end
    self
  end
end

module Lokii
  class Config    
    def self.setup(&block)
      define_accessors :options, :configuration, :settings, :database, :messages
      self.options = {}
      block.call(self)
      load_config
      load_defaults
      load_application
      setup_defaults
      setup_database
    end
    
    def self.root
      LOKII_ROOT
    end

    def self.environment
      (defined?(LOKII_ENV) ? LOKII_ENV : ENV['LOKII_ENV'] || "development").to_sym
    end

    def self.[](key)
      self.setup
      return self.configuration[key.to_sym]
    end
    
    def self.[]=(key, value)
      self.setup
      self.configuration[key.to_sym] = value
      return value
    end
    
    def self.to_hash
      self.configuration
    end

  private
  
    def self.load_config
      self.configuration = {}
      self.database = YAML.load_file(File.join(self.root, 'config', 'database.yml')) rescue nil
      self.messages = YAML.load_file(File.join(self.root, 'config', 'messages.yml')) rescue nil
      self.settings = YAML.load_file(File.join(self.root, 'config', 'settings.yml')) 
      self.load_settings
      self.map_config
    end  
    
    def self.load_settings
      self.settings.symbolize_keys!
      self.configuration.merge!(self.settings[self.environment].merge(self.options))
      self.configuration.symbolize_keys!
    end
     
    def self.map_config  
      self.database.symbolize_keys! if self.database
      self.messages.symbolize_keys! if self.messages
      
      mod = Module.new do
        Config.configuration.keys.each do |k|
          define_method(k) do
            return Config.configuration[k]
          end
        
          define_method("#{k}=") do |val|
            Config.configuration[k] = val
          end
        end
      end
      
      # Extend and include.
      extend mod
      include mod
    end
    
    def self.load_defaults
    end

    def self.load_application
      app = Dir[File.join(self.root, 'app', '**', '*.rb')].map { |h| h[0..-4] }
      app.each do |f|
        require f
      end
    end
          
    def self.setup_defaults
      Lokii::Logger.setup
    end
    
    def self.setup_database
      return unless self.options[:database]
      require 'active_record'
      ActiveRecord::Base.establish_connection(Lokii::Config.database[Lokii::Config.environment])
      ActiveRecord::Base.logger = Lokii::Logger
    rescue Exception => e
      Lokii::Logger.error "Could not initialize the database #{e.to_yaml}"
    end
    
    def self.define_accessors(*args) 
      args.each {|attr|
        class_eval("unless defined? @@#{attr}\n@@#{attr} = nil\nend\n\ndef self.#{attr}\n@@#{attr}\nend\n\ndef #{attr}\n@@#{attr}\nend\n", __FILE__, __LINE__)
        class_eval("unless defined? @@#{attr}\n@@#{attr} = nil\nend\n\ndef self.#{attr}=(obj)\n@@#{attr} = obj\nend\n\ndef #{attr}=(obj)\n@@#{attr} = obj\nend\n", __FILE__, __LINE__)    
      }
    end
  end  
end  