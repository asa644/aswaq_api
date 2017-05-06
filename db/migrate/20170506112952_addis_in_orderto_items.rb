class AddisInOrdertoItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :inOrder, :boolean, null: false, default: false
  end
end
