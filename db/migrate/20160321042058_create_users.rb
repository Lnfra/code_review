class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :photo_filename
      t.string :photo_content_type
      t.binary :photo_file_contents
      t.timestamps null: false

      #Foreign key to classroom
      t.integer :classroom_id


    end
  end
end

