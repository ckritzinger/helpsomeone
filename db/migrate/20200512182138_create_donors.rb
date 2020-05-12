class CreateDonors < ActiveRecord::Migration[6.0]
  def change
    create_table :donors do |t|
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
