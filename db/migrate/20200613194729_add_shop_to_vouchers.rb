class AddShopToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_reference :vouchers, :merchant, null: true, foreign_key: true
  end
end
