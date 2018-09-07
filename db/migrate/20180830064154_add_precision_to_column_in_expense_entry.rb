class AddPrecisionToColumnInExpenseEntry < ActiveRecord::Migration[5.2]
  def up
	add_column :expense_entries, :food_price, :decimal, {default: 0.0}
	#change_column :expense_entries, :food_price
  end
  def down
	remove_column :expense_entries, :food_price
  end
end
