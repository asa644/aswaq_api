class CreateItemsCategories < ActiveRecord::Migration
  def change
    create_view :items_categories
  end
end
