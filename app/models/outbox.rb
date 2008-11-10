class Outbox < ActiveRecord::Base
  establish_connection(Lokii::Config.database[:smsd])
  set_table_name 'outbox'
end  