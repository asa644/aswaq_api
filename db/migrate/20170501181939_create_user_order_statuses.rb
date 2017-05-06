class CreateUserOrderStatuses < ActiveRecord::Migration
  def change
    create_view :user_order_statuses
  end
end
