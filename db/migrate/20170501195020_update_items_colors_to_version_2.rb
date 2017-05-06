class UpdateItemsColorsToVersion2 < ActiveRecord::Migration
  def change
    create_view :items_colors
  end
end
