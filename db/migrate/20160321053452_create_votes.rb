class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.timestamps null: false

      #Foreign key to user and answer
      t.integer :user_id
      t.integer :answer_id
    end
  end
end
