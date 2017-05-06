class CreateItemsColors < ActiveRecord::Migration
  def change
    drop_view :items_colors
  end
end
