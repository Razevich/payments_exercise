require 'rails_helper'

RSpec.describe Payment, type: :model do

  context "Setting associations" do
    it "Should belong to Loan" do
      t = Payment.reflect_on_association(:loan)
      expect(t.macro).to eql(:belongs_to)
    end
  end

  context "Should not go over outstanding_balance" do
    let(:loan) {Loan.create!(funded_amount: 100.00)}
    let(:payment) {loan.payments.new(amount: 20)}
    let(:payment2) {loan.payments.new(amount: 120)}

    it "Should be valid if payment is less than outstanding balance" do
      expect(payment).to be_valid
    end

    it "Should not be valid if payment is greater than outstanding balance" do
      expect(payment2).to be_invalid
    end
  end
end
