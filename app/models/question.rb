class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :quiz_page
  has_one :answer

  has_many :applicant_test_answers


  before_save :save_question_name


  def save_question_name
  	self.name = self.question_data["name"] || ""
  end


end
