class ChangeName < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :itemPhoto, :itemphoto
  end
end
