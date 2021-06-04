class AddUserToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :user_id, :integer
  end
end
