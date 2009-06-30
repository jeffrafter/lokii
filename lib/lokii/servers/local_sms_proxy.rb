require 'sms'
require 'date'
require 'time'

module Lokii

  class LocalSmsProxy
    attr_reader :modem

    def initialize(modem)
      @modem = modem
    end

    def sms(number, text)
      @modem.sms(number, text)
    end
    
    def messages
      @modem.process
      @modem.messages || []
    end
  end  
end