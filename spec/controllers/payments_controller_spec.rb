require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    let(:loan) { Loan.create!(funded_amount: 100.0) }

    context "if the loan is found" do
      it 'responds with a 200' do
        get :index, loan_id: loan.id
        expect(response).to have_http_status(:ok)
      end
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :index, loan_id: 10000
          expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "#show" do
    let(:loan) { Loan.create!(funded_amount: 100.0) }
    let(:payment) {loan.payments.create(amount: 20.0)}

    context "if the loan payment is found" do
      it "responds with a 200" do
        get :show, loan_id: loan.id, id: payment.id
        expect(response).to have_http_status(:ok)
      end
    end

    context "if the loan payment is not found" do
      it "responds with 404" do
        get :show, loan_id: loan.id, id: 200000
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "create" do
    # context "if the payment is created" do
    #   let(:loan) { Loan.create!(funded_amount: 100.0) }
    #   let(:payment) {loan.payments.create(amount: 20.0)}

    #   it "creates payment" do
    #   expect{
    #     post :create, payment: payment.amount, loan_id: loan.id
    #   }.to change(Payment,:count).by(1)
    #   end
    # end

    context "if the payment is not created" do
      let(:loan) { Loan.create!(funded_amount: 100.0) }
      let(:payment) {loan.payments.create(amount: 200.0)}

      it "responds with error" do
      payment.errors.messages[:amount].should include("Payment can not exceed loans outstanding balance")
      end
    end
  end

end
