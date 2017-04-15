class ChangeInfosToInfo < ActiveRecord::Migration[5.0]
  def change
    rename_column :payments, :billing_infos_id, :billing_info_id

  end
end
