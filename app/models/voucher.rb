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
  STATES = %w(created sent)
  belongs_to :recipient, optional: true
  validates :state, inclusion: { in: STATES }
  has_many :expenses
  before_save do
    self.code ||= SecureRandom.base64(10)
      .upcase.gsub(/[^\w]/,'')
      .scan(/./).sample(6)
      .each_slice(3)
      .map{|x| x.join}.join('-')
  end

  def sent?
    self.state == 'sent'
  end
end
