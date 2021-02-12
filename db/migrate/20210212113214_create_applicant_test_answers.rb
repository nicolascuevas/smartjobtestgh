class CreateApplicantTestAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :applicant_test_answers do |t|
      t.string :value
      t.references :applicant_test, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
