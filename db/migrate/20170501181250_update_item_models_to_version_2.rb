class UpdateItemModelsToVersion2 < ActiveRecord::Migration
  def change
    drop_view :item_models
  end
end
