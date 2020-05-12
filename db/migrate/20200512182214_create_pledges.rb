class CreatePledges < ActiveRecord::Migration[6.0]
  def change
    create_table :pledges do |t|
      t.references :donor, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: true
      t.integer :weekly_amount_in_rands

      t.timestamps
    end
  end
end
