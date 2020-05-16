module ApplicationHelper
  def cents_to_rands(cents)
    "R #{number_with_precision(0.01 * cents, precision: 2)}"
  end
end
