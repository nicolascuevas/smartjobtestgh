class ApplicantTest < ApplicationRecord
  belongs_to :applicant
  belongs_to :applicant_test_status
  belongs_to :quiz
  has_many :applicant_test_answers
end
