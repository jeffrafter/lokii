require 'rubygsm'
require 'lokii/servers/gsm_proxy'

module Lokii

  # The gsm server operates against connected gsm modem(s). If the ports 
  # property is specified in the settings it will try to pool connections 
  # to the various ports, otherwise it will attempt to auto-detect
  class GsmServer < Server
  
    attr_reader :proxies

    def connect
      Lokii::Logger.debug "Connecting"
      modems = []
      ports = Lokii::Config.ports.split(',') rescue []
      ports.each {|port| modems << Gsm::Modem.new(port) }
      modems = [Gsm::Modem.new] if modems.empty?
      modems.each {|modem| modem.encoding = Lokii::Config.encoding.to_sym} if Lokii::Config.encoding
      modems.each {|modem| modem.keep_inbox_empty = true}
      @proxies = modems.map{|modem| Lokii::GsmProxy.new(modem) }
      @current = 0
    end      
  
    def check
      self.proxies.each {|proxy|
        proxy.messages.each {|message|
          handle(message)    
        }      
      }  
    end

    def say(text, number, reply = nil)
      @current += 1
      @current = 0 if @current > proxies.size - 1 
      @proxies[@current].outgoing(number, text)
    end
  end  
end