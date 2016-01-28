class Loan < ActiveRecord::Base
  has_many :payments

  after_save :set_outstanding_balance

  # def outstanding_balance
  #   self.payments.map { |payment| self.funded_amount -= payment.amount.to_f }
  # end

  def set_outstanding_balance
    self.outstanding_balance = self.funded_amount
  end
end
