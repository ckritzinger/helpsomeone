class HomeController < ApplicationController
  def index
    @recipients = Recipient.all
  end
end
