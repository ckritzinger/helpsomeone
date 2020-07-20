class HomeController < ApplicationController
  def index
    @recipients = Recipient.all
  end
  def about
  end
  def data
  end
end
