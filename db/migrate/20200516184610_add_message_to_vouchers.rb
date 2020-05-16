class AddMessageToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_column :vouchers, :message, :text
  end
end
