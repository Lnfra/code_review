class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.binary :profile_photo
      t.boolean :is_teacher
      t.timestamps null: false

      #Foreign key to classroom
      t.integer :classroom_id


    end
  end
end

