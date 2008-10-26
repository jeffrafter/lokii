class ILoveYouHandler < Lokii::Handler
  def process
    Lokii::Logger.debug "Processing message with the I love you handler"
    reply "I love you too" if message.text.downcase == "i love you" || message.text.downcase == "i love u" 
  end
end