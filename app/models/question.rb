class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :quiz_page
  has_one :answer

  has_many :applicant_test_answers
end
