class CreateGroupActivityTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :group_activity_types do |t|
      t.integer :group_id
      t.integer :activity_type_id

      t.timestamps
    end
  end
end
