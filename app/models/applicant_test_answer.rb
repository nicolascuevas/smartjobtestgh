class ApplicantTestAnswer < ApplicationRecord
  belongs_to :applicant_test
  belongs_to :question
end
