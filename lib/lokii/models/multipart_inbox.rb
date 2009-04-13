module Lokii
  class MultipartInbox < ActiveRecord::Base
    establish_connection(Lokii::Config.messages[Lokii::Config.environment]) if Lokii::Config.messages[Lokii::Config.environment]
    named_scope :pending, :conditions => ['processed = 0']
    set_table_name 'multipartinbox'
  end  
end