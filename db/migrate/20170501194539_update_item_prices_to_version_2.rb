class UpdateItemPricesToVersion2 < ActiveRecord::Migration
  def change
    drop_view :item_prices
  end
end
