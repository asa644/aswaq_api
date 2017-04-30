class RenameItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :itemPrice, :itemprice
    rename_column :items, :itemColor, :itemcolor
    rename_column :items, :itemDescription, :itemdescription
    rename_column :items, :itemModel, :itemmodel
    rename_column :items, :itemSize, :itemsize
    rename_column :items, :itemStockqty, :itemstockqty
  end
end
