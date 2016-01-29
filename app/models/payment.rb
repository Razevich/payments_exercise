class Payment < ActiveRecord::Base
  belongs_to :loan

  validate :check_payment

  def check_payment
    if self.amount > loan.outstanding_balance
      errors.add(:amount, "Payment can not exceed loans outstanding balance")
    end
  end
end



