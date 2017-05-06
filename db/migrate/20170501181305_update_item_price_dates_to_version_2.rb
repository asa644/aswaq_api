class UpdateItemPriceDatesToVersion2 < ActiveRecord::Migration
  def change
    drop_view :item_price_dates
  end
end
