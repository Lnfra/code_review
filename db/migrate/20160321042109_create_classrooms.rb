class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.timestamps null: false

      #Foreign key to location
      t.integer :location_id
    end
  end
end