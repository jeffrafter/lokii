class BmiHandler < Lokii::Handler
  def process
    Lokii::Logger.debug "Running the BMI Handler"
    if message.text.match(/P/i) and message.text.match(/bmi/i)
      patient=Patient.find_by_national_id(message.text.split(" ").first).first
      reply "Patient not found" if patient.blank?
      reply "ID:#{patient.first_name.first}-#{patient.last_name.first},wgt:#{patient.current_weight},ht:#{patient.current_height},bmi:#{(patient.current_bmi).round rescue nil}..#{patient.art_therapeutic_feeding_message}"
    end
  end
end