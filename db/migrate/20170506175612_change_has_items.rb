class ChangeHasItems < ActiveRecord::Migration[5.0]
  def change
      remove_column :items, :inOrder
      add_column :has_items, :quantity, :integer
      add_column :has_items, :color, :string
  end
end
