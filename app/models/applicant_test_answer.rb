class ApplicantTestAnswer < ApplicationRecord
  belongs_to :applicant_test
  belongs_to :question

  scope :correct, -> { where(is_correct: true) }
  scope :incorrect, -> { where(is_correct: false) }



  def self.saveQuizAnswers(applicant_test, answers)

  	#we delete all record to store the last answers
  	applicant_test.applicant_test_answers.destroy_all

  	#save the new answers
  	answers.keys.each do |question_name|

  		question = applicant_test.quiz.questions.where(name: question_name).first
  		answer = ApplicantTestAnswer.new
  		answer.question = question
  		answer.applicant_test = applicant_test
  		answer.value = answers[question.question_data['name']]
  		if answers[question.question_data['name']] == question.correct_answer
  			answer.is_correct = true
  		else
  			answer.is_correct = false
  		end
  		answer.save
  	end

  end



end
