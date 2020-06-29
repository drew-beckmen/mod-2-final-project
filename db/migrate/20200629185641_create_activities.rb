class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.date :activity_date
      t.float :duration
      t.integer :activity_type_id
      t.integer :goal_id
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
