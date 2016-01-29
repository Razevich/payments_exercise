class PaymentsController < ApplicationController
  respond_to :json
  wrap_parameters include: Payment.attribute_names + [:amount]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    loan = Loan.find(params[:loan_id])
    render json: loan.payments
  end

  def show
    payment = Payment.find(params[:id])

    render json: payment
  end

  def create
    loan = Loan.find(params[:loan_id])
    payment = loan.payments.new(payment_params)

    if payment.save
      redirect_to loan_payments_path(loan)
    else
      render json: {errors: payment.errors.full_messages}
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount)
  end
end
