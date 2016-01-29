class RemoveOutstandingBalanceFromLoans < ActiveRecord::Migration
  def change
    remove_column :loans, :outstanding_balance, :decimal
  end
end
