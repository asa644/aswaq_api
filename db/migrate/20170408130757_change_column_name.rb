class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
        rename_column :items, :itemId, :id

  end
end
