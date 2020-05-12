class Pledge < ApplicationRecord
  belongs_to :donor
  belongs_to :recipient
end
