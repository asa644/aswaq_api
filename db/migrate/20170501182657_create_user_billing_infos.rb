class CreateUserBillingInfos < ActiveRecord::Migration
  def change
    create_view :user_billing_infos
  end
end
