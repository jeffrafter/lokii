module Lokii
  module ConfigurationMapper
    Config.configuration.keys.each do |k|
      define_method(k) do
        return Config.configuration[k]
      end
    
      define_method("#{k}=") do |val|
        Config.configuration[k] = val
      end
    end
  end
end  