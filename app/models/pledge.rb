# == Schema Information
#
# Table name: pledges
#
#  id                     :bigint           not null, primary key
#  donor_id               :bigint           not null
#  recipient_id           :bigint           not null
#  weekly_amount_in_rands :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Pledge < ApplicationRecord
  DEFAULT_PLEDGE_AMOUNT=250
  belongs_to :donor
  belongs_to :recipient
  accepts_nested_attributes_for :donor, reject_if: :existing_donor?
  before_validation do
    self.weekly_amount_in_rands ||= DEFAULT_PLEDGE_AMOUNT
  end


  private

  def existing_donor?(donor_attr)
    if _donor = Donor.find_by(email: donor_attr[:email])
      self.donor = _donor
      return true
    end
    return false
  end

end
