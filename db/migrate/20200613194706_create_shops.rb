class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :title

      t.timestamps
    end
  end
end
