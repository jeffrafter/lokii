module Lokii
  class Config
    
    cattr_accessor :configuration, :database

    def self.setup(options = {})
      load_config(options)
      load_application
      setup_defaults
      setup_database
    end
    
    def self.root
      defined?(LOKII_ROOT) ? LOKII_ROOT : File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
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
  
    def self.load_config(options = {})
      self.configuration = {}
      self.database = YAML.load_file(File.join(self.root, 'config', 'database.yml'))
      self.database.symbolize_keys!

      settings_yaml = YAML.load_file(File.join(self.root, 'config', 'settings.yml'))
      settings_yaml.symbolize_keys!
      loaded_options = settings_yaml[self.environment].merge(options)
      self.configuration.merge!(loaded_options)
      self.configuration.symbolize_keys!
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
      ActiveRecord::Base.establish_connection(Lokii::Config.database[Lokii::Config.environment])
    rescue
      # Do nothing
    end
    
  end
end  