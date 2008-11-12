class NewLoveHandler < Lokii::Handler
  def process
    Lokii::Logger.debug "Running the NewLoveHandler"

    if message.text.downcase =="i love you" then
      dialect = "formal"
    elsif message.text.downcase =="i love u" || message.text.downcase =="i luv u" then
      dialect = "txter"
    end

    if dialect == "formal" then 
      reply("Of course, I love you, as well, my darling.") and complete
    elsif dialect == "txter" then 
      reply("i <3 u 2") and complete
    end
  end
end


