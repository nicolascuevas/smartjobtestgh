class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :value
      t.string :correct_answer
      t.string :field_type
      t.string :input_type
      t.jsonb :question_data
      t.references :quiz, null: false, foreign_key: true
      t.references :quiz_page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
