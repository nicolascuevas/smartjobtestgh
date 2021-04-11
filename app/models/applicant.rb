class Applicant < ApplicationRecord

	has_many :applicant_tests, dependent: :destroy
	has_many :quizzes, through: :applicant_test


	def full_name
		"#{self.first_name} #{self.last_name}"
	end

end
