class ApplicantTest < ApplicationRecord

	

	belongs_to :applicant
	belongs_to :applicant_test_status
	belongs_to :quiz
	has_many :applicant_test_answers, dependent: :destroy

	after_save :check_pending_tests

	scope :pending, -> { joins(:applicant_test_status).where("applicant_test_statuses.name ilike 'pendiente'") }
	scope :completed, -> { joins(:applicant_test_status).where("applicant_test_statuses.name ilike 'completado'") }


	def check_answers
		if self.applicant_test_status.name == "Completado"
	  		self.grade = (100 * self.applicant_test_answers.correct.count / self.quiz.questions.count).round()
	  	else
	  		self.grade = 0
	  	end
	  	self.save
	end

	def check_pending_tests

		if self.applicant.applicant_tests.pending.count == 0 && self.applicant.applicant_tests.completed.count > 0
			UserMailer.with(applicant: self.applicant, user: self.applicant.user).applicant_answered_tests.deliver_later
		end
	end

end

