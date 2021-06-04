class Applicant < ApplicationRecord


	has_many :applicant_tests, dependent: :destroy
	has_many :quizzes, through: :applicant_test


	before_create :add_token


	def full_name
		"#{self.first_name} #{self.last_name}"
	end

	def add_token
		self.token = UUIDTools::UUID.timestamp_create.to_s
	end

end
