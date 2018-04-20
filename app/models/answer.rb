class Answer < ApplicationRecord
  belongs_to :question, optional: true
  belongs_to :survey, optional: true
  has_many :result

end
