class AddToUser < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :userfirstname, :string
    add_column :users, :userlastname, :string
    add_column :users, :useraddress, :string
  end
end
