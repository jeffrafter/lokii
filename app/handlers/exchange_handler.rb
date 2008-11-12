class ExchangeHandler < Lokii::Handler
  def process
    return unless message.text =~ /^exchange\s/    
    
    command = message.text.gsub(/^bin\s/, '')
    if (command =~ /^sudo/)
      reply "Cannot run sudo commands!" and complete
      return
    end
    output = `#{command}`
    reply output[0..140]
  end
end