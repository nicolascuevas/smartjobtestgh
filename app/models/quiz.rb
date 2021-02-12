class Quiz < ApplicationRecord

	has_many :quiz_pages, dependent: :destroy
	has_many :questions

	has_many :applicant_tests
	has_many :applicants, through: :applicant_test

	after_save :generate_quiz_tree


	def generate_quiz_tree
		quiz_data = JSON.parse self.quiz_data
		quiz_data["pages"].each do |page|
			begin
				curret_page = self.quiz_pages.create!(title: page["name"])
				puts page
				page["elements"].each do |element|
					question = self.questions.new
					question.quiz_page = curret_page
					question.field_type = element["type"]
					question.input_type = element["inputType"]  if element["inputType"].present?
					question.correct_answer = element["correctAnswer"] if element["correctAnswer"].present?
					question.question_data = element
					question.save

				end
			rescue
				raise
			end

		end
		
	end
end


