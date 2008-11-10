class Entry < ActiveRecord::Base
  belongs_to :form
  belongs_to :person
end