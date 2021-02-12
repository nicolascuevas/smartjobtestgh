class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :quiz_page

  has_many :applicant_test_answers
end
