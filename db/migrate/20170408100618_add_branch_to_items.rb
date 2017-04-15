class AddBranchToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :branch, foreign_key: true
  end
end
