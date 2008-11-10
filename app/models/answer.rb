class Answer < ActiveRecord::Base
  belongs_to :entry
  belongs_to :question
end