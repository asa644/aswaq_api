class CreateItemBrowses < ActiveRecord::Migration
  def change
    create_view :item_browses
  end
end
