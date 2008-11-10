class MultipartInbox < ActiveRecord::Base
  establish_connection(Lokii::Config.database[:smsd])
  set_table_name 'multipartinbox'
end  