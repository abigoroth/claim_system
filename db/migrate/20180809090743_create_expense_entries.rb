class CreateExpenseEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_entries do |t|
      t.date :created
      t.text :description
      t.decimal :travel_distance
      t.decimal :travel_price
      t.decimal :food_price
      t.decimal :parking_price
      t.decimal :toll_price
      t.decimal :fixed_asset_price
      t.decimal :misc_price

      t.timestamps
    end
  end
end
