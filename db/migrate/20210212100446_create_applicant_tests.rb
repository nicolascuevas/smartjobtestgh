class CreateApplicantTests < ActiveRecord::Migration[6.1]
  def change
    create_table :applicant_tests do |t|
      t.references :applicant, null: false, foreign_key: true
      t.datetime :due_date
      t.references :applicant_test_status, null: false, foreign_key: true, default: 1
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
