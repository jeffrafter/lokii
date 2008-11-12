class BinHandler < Lokii::Handler
  def process
    return unless message.text =~ /^bin\s/i    
    command = message.text.gsub(/^bin\s/i, '')
    if (command =~ /^sudo/)
      reply "Cannot run sudo commands!" and complete
      return
    end
    output = `#{command}`
    reply output[0..140]
  end
end