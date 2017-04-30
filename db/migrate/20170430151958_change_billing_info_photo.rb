class ChangeBillingInfoPhoto < ActiveRecord::Migration[5.0]
  def change
    remove_column :billing_infos, :photo, :string
    add_column :billing_infos, :billingInfoExp, :string
  end
end
