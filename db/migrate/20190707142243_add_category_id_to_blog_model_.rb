class AddCategoryIdToBlogModel < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs,:category_id,:integer
  end
end
