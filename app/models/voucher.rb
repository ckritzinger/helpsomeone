# == Schema Information
#
# Table name: vouchers
#
#  id              :bigint           not null, primary key
#  recipient_id    :bigint
#  amount_in_rands :integer
#  code            :string
#  state           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Voucher < ApplicationRecord
  belongs_to :recipient, optional: true
end
