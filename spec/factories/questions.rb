FactoryBot.define do
  factory :question do
    name { "MyString" }
    value { 1 }
    correct_answer { "MyString" }
    type { "" }
    inputType { "MyString" }
    quiz { nil }
    quiz_page { nil }
  end
end
