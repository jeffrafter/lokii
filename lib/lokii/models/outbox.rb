module Lokii
  class Outbox < ActiveRecord::Base
    establish_connection(Lokii::Config.messages[Lokii::Config.environment]) if Lokii::Config.messages[Lokii::Config.environment]
    named_scope :pending, :conditions => ['processed = 0']
    set_table_name 'outbox'
  end  
end  