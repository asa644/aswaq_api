class ChangeBillingInfo < ActiveRecord::Migration[5.0]
  def change
    remove_column :billing_infos, :BillingInfoBankName, :string
    remove_column :billing_infos, :BillingInfoBankBranch, :string
    add_column :billing_infos, :photo, :string

  end
end
