class CreateBelongs < ActiveRecord::Migration[5.0]
  def change
    create_table :belongs do |t|
      t.references :item, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
