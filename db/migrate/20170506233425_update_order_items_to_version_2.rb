class UpdateOrderItemsToVersion2 < ActiveRecord::Migration
  def change
    update_view :order_items, version: 2, revert_to_version: 1
  end
end
