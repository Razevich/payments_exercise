class Loan < ActiveRecord::Base
  has_many :payments

  before_save :outstanding_balance

  def total_payments
    self.payments.sum(:amount)
  end

  def outstanding_balance
    self.funded_amount - total_payments
  end

  def as_json(options={})
    super(options.merge(methods: :outstanding_balance))
  end

end
