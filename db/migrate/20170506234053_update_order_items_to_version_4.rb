class UpdateOrderItemsToVersion4 < ActiveRecord::Migration
  def change
    update_view :order_items, version: 4, revert_to_version: 3
  end
end
