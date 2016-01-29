require 'rails_helper'

RSpec.describe Loan, type: :model do

  context "Set outstanding balance" do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    let(:payment) { loan.payments.create!(amount: 20)}

    it "Should set inital outstanding blance to funded amout" do
      expect(loan.outstanding_balance.to_f).to be(100.0)
    end

    it "Should set outstanding balance after a payment" do
      loan.payments << payment

      expect(loan.outstanding_balance.to_f).to be(80.0)
    end
  end
end