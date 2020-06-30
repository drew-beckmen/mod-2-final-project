class AddImgUrlToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :img_url, :string
  end
end
