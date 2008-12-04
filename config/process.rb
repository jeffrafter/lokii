loop do
  Lokii::Processor.process
  sleep(Lokii::Config.interval)  
end