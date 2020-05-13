class Expense < ApplicationRecord
  belongs_to :voucher
  belongs_to :expense_category
end
