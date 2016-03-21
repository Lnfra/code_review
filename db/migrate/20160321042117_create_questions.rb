class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.timestamps null: false

      #Foreign key to user
      t.integer :user_id
    end
  end
end
