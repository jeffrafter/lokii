class Worker < ActiveRecord::Base
  named_scope :active, :conditions => ['voided = 0 AND disabled = 0']
end