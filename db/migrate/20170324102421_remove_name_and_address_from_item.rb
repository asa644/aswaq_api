class RemoveNameAndAddressFromItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :name, :string
    remove_column :items, :address, :string
  end
end
