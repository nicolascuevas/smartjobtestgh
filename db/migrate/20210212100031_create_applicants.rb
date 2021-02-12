class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :token

      t.timestamps
    end
  end
end
