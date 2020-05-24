# == Schema Information
#
# Table name: recipients
#
#  id           :bigint           not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  story        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Recipient < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :images
  has_many :pledges

  def name
    first_name
  end

  def progress
   (pledges.sum(:weekly_amount_in_rands) * 100.0 / Pledge::DEFAULT_PLEDGE_AMOUNT).round
  end

  def needs_funding?
    progress < 100
  end

  def title
    [first_name, last_name].join(' ')
  end
end
