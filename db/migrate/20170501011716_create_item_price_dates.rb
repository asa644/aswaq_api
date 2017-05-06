class CreateItemPriceDates < ActiveRecord::Migration
  def change
    create_view :item_price_dates
  end
end
