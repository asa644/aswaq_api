class CreateItemModels < ActiveRecord::Migration
  def change
    create_view :item_models
  end
end
