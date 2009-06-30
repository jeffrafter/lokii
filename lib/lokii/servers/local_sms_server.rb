module Lokii

  # The sms server operates against connected sms modem(s). If the ports 
  # property is specified in the settings it will try to pool connections 
  # to the various ports, otherwise it will attempt to auto-detect
  class LocalSmsServer < Server
  
    attr_reader :proxies

    def connect
      Lokii::Logger.debug "Connecting"
      ports = Lokii::Config.ports.split(',') rescue []
      ports.each {|port| modems << Sms.new(port) }
      modems = [Sms.new] if modems.empty?
      modems.each {|modem| modem.encoding = Lokii::Config.encoding.to_sym} if Lokii::Config.encoding
      @proxies = modems.map{|modem| Lokii::LocalSmsProxy.new(modem) }
      @current = 0
    end      
  
    def check
      self.proxies.each {|proxy|
        proxy.messages.each {|message|
          begin
            hash = {
              :phone => 0, 
              :number => message[:from], 
              :text => message[:text], 
              :created_at => message[:created_at], 
              :processed_at => message[:processed_at]}
            handle(hash)    
          rescue Exception => e
            Lokii::Logger.debug "Could not receive message from #{message[:from]} (#{e.message})"
            next
          end
        }      
      }  
    end

    def say(text, number, reply = nil)
      @current += 1
      @current = 0 if @current > @proxies.size - 1 
      @proxies[@current].sms(number.gsub(/\+/, ''), text)
      Lokii::Logger.debug "Message sent"
    rescue Exception => e
      Lokii::Logger.debug "Could not send message #{e.message}"  
    end
  end      
end