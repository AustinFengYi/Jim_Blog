class AddBlogAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs,:title,:string
    add_column :blogs,:date,:string
    add_column :blogs,:description,:text
    add_column :blogs,:image,:string
  end
end
