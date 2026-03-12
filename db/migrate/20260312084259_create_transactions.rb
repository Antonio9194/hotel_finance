class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :type
      t.string :category
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
