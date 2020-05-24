class PledgesController < ApplicationController
  def create
    @pledge = Pledge.new(pledge_parameters)
    @pledge.save!
    PledgeMailer.with(pledge: @pledge).created.deliver_later
    redirect_to root_path
  end

  private

  def pledge_parameters
    params.require(:pledge).permit(
      :recipient_id,
      :amount,
      :duration,
      donor_attributes: [
        :email,
        :phone_number
      ]
    )
  end
end
