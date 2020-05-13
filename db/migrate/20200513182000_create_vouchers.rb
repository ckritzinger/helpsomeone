class CreateVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :vouchers do |t|
      t.references :recipient, null: false, foreign_key: true
      t.integer :amount_in_rands
      t.string :code
      t.string :state

      t.timestamps
    end
  end
end
