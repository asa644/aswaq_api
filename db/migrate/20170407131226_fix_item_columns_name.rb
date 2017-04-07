class FixItemColumnsName < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :id, :itemId
    rename_column :items, :size, :itemSize
    rename_column :items, :model, :itemModel
    rename_column :items, :description, :itemDescription
    rename_column :items, :stockqty, :itemStockqty
    rename_column :items, :price, :itemPrice
    rename_column :items, :photo, :itemPhoto
  end
end
