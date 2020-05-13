# == Schema Information
#
# Table name: expense_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExpenseCategory < ApplicationRecord
end
