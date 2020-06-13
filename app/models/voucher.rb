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
#  message         :text
#  merchant_id     :bigint
#

class Voucher < ApplicationRecord

  belongs_to :merchant
  belongs_to :recipient, optional: true

  STATES = %w(created allocated sent tracked)
  belongs_to :recipient, optional: true
  validates :state, inclusion: { in: STATES }
  has_many :expenses
  before_validation do
    self.state ||= 'created'
    self.code ||= SecureRandom.base64(10)
      .upcase.gsub(/[^\w]/,'')
      .scan(/./).sample(6)
      .each_slice(3)
      .map{|x| x.join}.join('-')
  end

  def sent?
    self.state == 'sent'
  end

  def send!
    Twilio::REST::Client.new(
      Rails.application.credentials.dig(:twilio, :account_sid),
      Rails.application.credentials.dig(:twilio, :auth_token)
    ).messages.create(
      from: ENV.fetch('FROM_PHONE_NUMBER','+12073863936'),
      to: recipient.phone_number.gsub(/^0/,'+27'),
      body: message
    )
  end

  def default_message
    [
      "Hello #{recipient.first_name} I hope you are well.",
      "Here is a voucher that you can use at Kay's Minimarket.",
      "They will give you R#{amount_in_rands} of goods for this voucher.",
      "If you don't understand or you need help, you can ask Fatima to explain.",
      "Your voucher number is: #{code}",
    ].join(' ')
  end
end
