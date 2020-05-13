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
  belongs_to :donor
  belongs_to :recipient
end
