class UpdateOrderItemsToVersion3 < ActiveRecord::Migration
  def change
    update_view :order_items, version: 3, revert_to_version: 2
  end
end
