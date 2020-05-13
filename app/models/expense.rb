# == Schema Information
#
# Table name: expenses
#
#  id                  :bigint           not null, primary key
#  voucher_id          :bigint           not null
#  amount_in_cents     :integer
#  description         :string
#  expense_category_id :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Expense < ApplicationRecord
  belongs_to :voucher
  belongs_to :expense_category
end
