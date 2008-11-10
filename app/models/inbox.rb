class Inbox < ActiveRecord::Base
  establish_connection(Lokii::Config.database[:smsd])
  set_table_name 'inbox'
end