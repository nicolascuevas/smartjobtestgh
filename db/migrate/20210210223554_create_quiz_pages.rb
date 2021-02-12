class CreateQuizPages < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_pages do |t|
      t.string :title
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
