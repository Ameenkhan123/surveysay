class Results < ApplicationRecord
	belongs_to :survey, optional: true
	belongs_to :answer, optional: true, :through => :result
  belongs_to :question, optional: true


end
