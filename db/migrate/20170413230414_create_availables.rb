class CreateAvailables < ActiveRecord::Migration[5.0]
  def change
    create_table :availables do |t|
      t.references :item, foreign_key: true
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
