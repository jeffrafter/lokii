class AdherenceHandler < Lokii::Handler
  def process
    Lokii::Logger.debug "Processing message with adherence handler"
    #"ad P17000000001"
    (command, patient_id) = message.text.downcase.split(' ')
    if command == 'ad'
      patient = Patient.find_by_national_id(patient_id).first rescue nil
      if patient
        msg = "#{patient.art_amount_remaining_if_adherent(Date.today).values.sum} tablets should be with Patient #{patient.national_id} at the end of today" rescue "There was an error processing your query"
        reply msg
      else
        reply "Patient #{patient_id} not found"
      end
    else
      reply "Unknown command. Usage: ad <Patient National ID>"
    end
  end
end