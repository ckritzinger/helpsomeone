class AddEndDateToPledge < ActiveRecord::Migration[6.0]
  def change
    add_column :pledges, :end_date, :datetime
  end
end
