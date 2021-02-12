class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :description
      t.jsonb :quiz_data

      t.timestamps
    end
  end
end
