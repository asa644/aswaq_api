class CreateItemSizes < ActiveRecord::Migration
  def change
    create_view :item_sizes
  end
end
