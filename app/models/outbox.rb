class Outbox < ActiveRecord::Base
  set_table_name 'outbox'
end  