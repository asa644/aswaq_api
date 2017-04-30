class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :colorvalue

      t.timestamps
    end
  end
end
