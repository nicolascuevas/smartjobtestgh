FactoryBot.define do
  factory :applicant_test_answer do
    value { "MyString" }
    applicant_test { nil }
    question { nil }
  end
end
