class CreateColorItems < ActiveRecord::Migration[5.0]
  def change
    create_table :color_items do |t|
      t.references :color, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
  remove_column :items, :itemcolor, :string
end
