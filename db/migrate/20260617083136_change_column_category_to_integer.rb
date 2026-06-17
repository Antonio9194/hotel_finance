class ChangeColumnCategoryToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :category, :integer
  end
end
