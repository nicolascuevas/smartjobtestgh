class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :quiz_page
end
