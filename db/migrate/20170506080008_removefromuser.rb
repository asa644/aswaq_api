class Removefromuser < ActiveRecord::Migration[5.0]
  def change
     remove_column :users, :userfirstname, :string
     remove_column :users, :userlastname, :string

  end
end
