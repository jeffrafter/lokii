class EntryHandler < Lokii::Handler
  attr_reader :entry, :person

  def process
    Lokii::Logger.debug "Processing message with the entry handler"    
    @entry = Entry.active.find(:first, :conditions => ['worker_id' => @worker.id], :include => :person)
    @person = entry ? entry.person : nil
    
    return if self.cancel? && entry.nil?
    return if self.new_entry? && entry
    
    # Is the command for a new form
    # Is there a person
    # Has it timed out
    # Store the answer with the question
    # Ask the next question, or complete
    
    
    # reply "I love you too" if message.text.downcase == "i love you" || message.text.downcase == "i love u" 
  end
  
  def command
    return nil if @message.text.blank?
    text = @message.text.downcase.strip  
    text.split(/ /).first    
  end

  def cancel?
    command == "cancel"
  end  
  
  def skip?
    command == "skip"
  end
  
  def help?
    command == "help"
  end
  
  def timeout?
    entry && entry.updated_at > Time.now - 15.minutes
  end
end