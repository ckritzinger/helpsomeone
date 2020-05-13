class AllowNullRecipientForVouchers < ActiveRecord::Migration[6.0]
  def change
    change_column :vouchers, :recipient_id, :bigint, null: true
  end
end
