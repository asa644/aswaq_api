class CreateBillingInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :billing_infos do |t|
      t.string :BillingInfoCardNumber, limit: 16
      t.string :BillingInfoCvv, limit: 3
      t.string :BillingInfoBankName, limit: 100
      t.string :BillingInfoBankBranch, limit: 200
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
