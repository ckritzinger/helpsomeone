class VouchersController < ApplicationController

  before_action do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin' && password == ENV.fetch('RAILS_ADMIN_PASSWORD','pass')
    end
  end

  def index
    @vouchers = Voucher.all.order(updated_at: :desc)
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

  private

  def expense_parameters
    params.require(:expense).permit(:amount,:description,:expense_category_id)
  end
end
