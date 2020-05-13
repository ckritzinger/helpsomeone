class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :voucher, null: false, foreign_key: true
      t.integer :amount_in_cents
      t.string :description
      t.references :expense_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
