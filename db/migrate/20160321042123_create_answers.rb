class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.timestamps null: false

      #Foreign key to user, question, code_language
      t.integer :user_id
      t.integer :question_id
      t.integer :code_language_id

    end
  end
end
