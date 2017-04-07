class AddColumnsToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :size, :string
    add_column :items, :model, :string
    add_column :items, :color, :string
    add_column :items, :stockqty, :integer
    add_column :items, :price, :float
    add_column :items, :image, :string
    add_column :items, :description, :string
  end
end
