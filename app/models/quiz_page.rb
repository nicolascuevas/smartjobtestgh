class QuizPage < ApplicationRecord

  belongs_to :quiz
  has_many :questions, dependent: :destroy


end
