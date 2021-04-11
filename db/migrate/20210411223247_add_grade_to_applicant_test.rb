class AddGradeToApplicantTest < ActiveRecord::Migration[6.1]
  def change
    add_column :applicant_tests, :grade, :integer, default: 0
  end
end
