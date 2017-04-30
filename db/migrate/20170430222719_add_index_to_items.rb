class AddIndexToItems < ActiveRecord::Migration[5.0]
  def change
    add_index(:items, [:created_at, :itemprice, :itemsize])
    add_index(:orders, [:orderStatus])

  end
end
