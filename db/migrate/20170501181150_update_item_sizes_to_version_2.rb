class UpdateItemSizesToVersion2 < ActiveRecord::Migration
  def change
    drop_view :item_sizes
  end
end
