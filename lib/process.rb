loop do
  Lokii::Server.process
  sleep(Lokii::Config.interval)  
end