class CreateItemsBranches < ActiveRecord::Migration
  def change
    create_view :items_branches
  end
end
