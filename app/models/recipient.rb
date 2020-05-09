class Recipient < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :images

  def name
    first_name
  end

  def progress
    35
  end
end
