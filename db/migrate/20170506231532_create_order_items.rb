class CreateOrderItems < ActiveRecord::Migration
  def change
    create_view :order_items
  end
end
