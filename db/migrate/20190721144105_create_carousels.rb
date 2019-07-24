class CreateCarousels < ActiveRecord::Migration[5.2]
  def change
    create_table :carousels do |t|
      t.string :image
      t.string :title
      t.text :description
      t.integer :category_id
      t.timestamps
    end
  end
end
