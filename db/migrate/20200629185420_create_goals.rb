class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.float :target_hours
      t.integer :user_id
      t.string :name 
      t.text :description
      t.date :start_day
      t.date :end_day
      t.timestamps
    end
  end
end
