require 'rubygsm'
require 'date'
require 'time'

module Lokii

  # Messages come into the GsmModem based on its own set of intervals (or 
  # with another command for certain gsm modems). Because of that we need
  # to proxy the callbacks and collect them on a per modem basis
  class GsmProxy
    attr_accessor :received
    attr_reader :modem

    def initialize(modem)
      @received = Array.new
      @modem = modem
      @modem.receive(method(:incoming))
    end

    def incoming(message)
      @received << message
    end

    def outgoing(number, text)
      @modem.send_sms(number, text)
    end
    
    def messages
      current = @received.dup 
      @received.clear
      current.map {|m| 
        {:phone => m.device,
         :number => m.sender,
         :text => m.text,
         :created_at => Time.parse("#{m.sent}"),
         :processed_at => Time.parse("#{m.received}")}
      }
    end
  end  
end