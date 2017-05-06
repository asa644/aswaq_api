class UpdateItemsColorsToVersion3 < ActiveRecord::Migration
  def change
    update_view :items_colors, version: 3, revert_to_version: 2
  end
end
