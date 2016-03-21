class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users do |t|
      #User and role has a many to many relationship, creating join table to represent
      #Foreign key to user_id and role_id
      t.integer :user_id
      t.integer :role_id
    end
  end
end
