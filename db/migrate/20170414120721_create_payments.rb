class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.float :paymentAmount
      t.integer :paymentType, default: "credit"
      t.references :billing_infos, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
