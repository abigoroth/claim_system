class RemoveTravelPriceFromExpenseEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :expense_entries, :travel_price, :integer
  end
end
