class PledgesController < ApplicationController
  def create
    @pledge = Pledge.new(pledge_parameters)
    if @pledge.save
      PledgeMailer.with(pledge: @pledge).created.deliver_later
    else
      render :error
    end
  end

  private

  def pledge_parameters
    params.require(:pledge).permit(
      :recipient_id,
      :weekly_amount_in_rands,
      :duration,
      donor_attributes: [
        :email,
        :phone_number
      ]
    )
  end
end
