class CreateApplicantTestStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :applicant_test_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
