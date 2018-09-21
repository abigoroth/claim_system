class ChangeColumnsRemoveDefault < ActiveRecord::Migration[5.2]
  def change
  	change_column_default(:expense_entries, :food_price, nil)
  	change_column_default(:expense_entries, :parking_price, nil)
  	change_column_default(:expense_entries, :toll_price, nil)
  	change_column_default(:expense_entries, :fixed_asset_price, nil)
  	change_column_default(:expense_entries, :misc_price, nil)	
  end
end
