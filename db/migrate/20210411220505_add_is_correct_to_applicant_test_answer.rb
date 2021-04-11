class AddIsCorrectToApplicantTestAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :applicant_test_answers, :is_correct, :bool, default: false
  end
end
