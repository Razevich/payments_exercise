require 'rails_helper'

RSpec.describe Payment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "Setting associations" do
    it "Should belong to LOAN" do
      t = Payment.reflect_on_association(:loan)
      t.macro.should == :belongs_to
    end
  end
end
