class ChangeColomnsItems < ActiveRecord::Migration[5.0]
  def change
     rename_column :items, :color, :itemColor
  end
end
