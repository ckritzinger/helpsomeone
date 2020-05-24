class PledgesController < ApplicationController
  def create
    @pledge = Pledge.create!(pledge_parameters)
    redirect_to root_path
  end

  private

  def pledge_parameters
    params.require(:pledge).permit(
      :recipient_id,
      :amount,
      donor_attributes: [
        :email,
        :phone_number
      ]
    )
  end
end
