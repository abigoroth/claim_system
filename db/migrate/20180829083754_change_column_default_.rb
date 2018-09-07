class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
	change_column_default :expense_entries, :food_price, 0
	change_column_default :expense_entries, :parking_price, 0
	change_column_default :expense_entries, :toll_price, 0
	change_column_default :expense_entries, :fixed_asset_price, 0
	change_column_default :expense_entries, :misc_price, 0
  end
end
