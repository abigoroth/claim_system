class ExpenseEntry < ApplicationRecord
	belongs_to :user_monthly_approval
	def travel_fare
		self.travel_distance.to_f*0.8 rescue 0 #if ada error,it ll save with zero
	end
	
	def total_expenses
		travel_fare+food_price+parking_price+toll_price+fixed_asset_price+misc_price
	end
	
	def travel_distance_unit
		travel_distance.to_s + " km"
	end
end
