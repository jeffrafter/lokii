class IdValidatorHandler < Lokii::Handler
  def process
    Lokii::Logger.debug "Running the idValidator"
    reply("This is an invalid Patient ID") if message.text.downcase.gsub(/\-/,"").length != 13 || message.text.downcase[0..0] != "p"
  end
end