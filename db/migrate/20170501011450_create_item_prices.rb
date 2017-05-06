class CreateItemPrices < ActiveRecord::Migration
  def change
    create_view :item_prices
  end
end
