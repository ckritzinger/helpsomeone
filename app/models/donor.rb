# == Schema Information
#
# Table name: donors
#
#  id           :bigint           not null, primary key
#  email        :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Donor < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  def title
    email #for rails admin
  end
end
