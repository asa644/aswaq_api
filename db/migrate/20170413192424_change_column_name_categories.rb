class ChangeColumnNameCategories < ActiveRecord::Migration[5.0]
  def change
      rename_column :categories, :name, :categoryName
  end
end
