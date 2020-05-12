class Recipient < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :images
  has_many :pledges

  def name
    first_name
  end

  def progress
   (pledges.sum(:weekly_amount_in_rands) * 100.0 / 200)
  end
end
