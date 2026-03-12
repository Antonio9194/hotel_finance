class ChangeTransactionTypeToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :transaction_type, :integer
  end
end