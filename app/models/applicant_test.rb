class ApplicantTest < ApplicationRecord

	

	belongs_to :applicant
	belongs_to :applicant_test_status
	belongs_to :quiz
	has_many :applicant_test_answers, dependent: :destroy


	def check_answers
		if self.applicant_test_status.name == "Completado"
	  		self.grade = (100 * self.applicant_test_answers.correct.count / self.quiz.questions.count).round()
	  	else
	  		self.grade = 0
	  	end
	  	self.save
	end

end
