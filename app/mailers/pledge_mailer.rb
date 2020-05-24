class PledgeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pledge_mailer.created.subject
  #
  def created
    @pledge=params[:pledge]
    mail to: "help@helpsomebody.co.za"
  end
end
