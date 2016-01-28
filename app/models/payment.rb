class Payment < ActiveRecord::Base
  belongs_to :loan

  validate :check_the_thing

  def check_the_thing
    amount < loan.amount
  end
  def check_payment
    if self.amount > loan.outstanding_balance
      errors.add(:amount, "Payment can not exceed loans outstanding balance")
    end
  end
end



def create
  payment = Payment.new(payment_params)
  if payment.save
    redn
  else
    render :payment.errors
  end
end

def payment_params

end