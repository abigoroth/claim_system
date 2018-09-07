json.extract! expense_entry, :id, :created, :description, :travel_distance, :travel_fare, :food_price, :parking_price, :toll_price, :fixed_asset_price, :misc_price, :created_at, :updated_at
json.url expense_entry_url(expense_entry, format: :json)
