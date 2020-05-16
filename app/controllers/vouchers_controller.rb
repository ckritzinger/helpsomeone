class VouchersController < ApplicationController

  before_action do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin' && password == ENV.fetch('RAILS_ADMIN_PASSWORD','pass')
    end
  end

  def index
    @vouchers = Voucher.all.order(updated_at: :desc)
    @vouchers = @vouchers.where(state: params[:state]) if params[:state]
  end

  def create
    quantity=params[:quantity].to_i
    (1..quantity).map do
      Voucher.create!(amount_in_rands: params[:amount_in_rands])
    end
    flash[:notice] = "Created #{quantity} vouchers"
    redirect_to vouchers_path(state: 'created')
  end

  def send_message
    @voucher = Voucher.find(params[:id])
    @voucher.update!(message_params)
    @voucher.send!
    @voucher.update(state: 'sent')
    flash[:notice] = "Sent SMS Message to #{@voucher.recipient.title}"
    redirect_to vouchers_path(state: @voucher.state)
  end

  def show
    @voucher = Voucher.find(params[:id])
    @expense = Expense.new
  end

  def add_expense
    @voucher = Voucher.find(params[:id])
    @voucher.expenses.create!(expense_parameters)
    redirect_to @voucher
  end

  def update
    @voucher = Voucher.find(params[:id])
    @voucher.update!(voucher_parameters)
    redirect_to vouchers_path(state: @voucher.state)
  end

  private

  def expense_parameters
    params.require(:expense).permit(:amount,:description,:expense_category_id)
  end

  def message_params
    params.require(:voucher).permit(:state, :message)
  end

  def voucher_parameters
    params.require(:voucher).permit(:state, :recipient_id)
  end
end
