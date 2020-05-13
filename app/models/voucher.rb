class Voucher < ApplicationRecord
  belongs_to :recipient, optional: true
end
