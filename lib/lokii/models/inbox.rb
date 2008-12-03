class Inbox < ActiveRecord::Base
  establish_connection(Lokii::Config.database[:messages]) if Lokii::Config.database[:messages]
  named_scope :pending, :conditions => ['processed = 0']
  set_table_name 'inbox'
end