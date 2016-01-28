require 'rails_helper'

RSpec.describe Loan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "Set outstanding balance" do
    let(:loan) { Loan.create!(funded_amount: 100.0) }

      it "Should set inital outstanding blance to funded amout" do

      expect(loan.outstanding_blance).to be(loan.funded_amount)
    end
  end
end