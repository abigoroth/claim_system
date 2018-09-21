class ExpenseEntry < ApplicationRecord
	belongs_to :user_monthly_approval
	def travel_fare
		self.travel_distance.to_f*0.8 rescue 0 #if ada error,it ll save with zero
	end
	
	def tf
		if travel_fare
			return travel_fare
		else
			0.0
		end
	end
	def fp
		if food_price
			return food_price
		else
			0.0
		end
	end
		def pp
		if parking_price
			return parking_price
		else
			0.0
		end
	end
	def tp
		if toll_price
			return toll_price
		else
			0.0
		end
	end
	def fap
		if fixed_asset_price
			return fixed_asset_price
		else
			0.0
		end
	end
	def mp
		if misc_price
			return misc_price
		else
			0.0
		end
	end
	def total_expenses
		tf+fp+pp+tp+fap+mp
	end
	
	def travel_distance_unit
		travel_distance.to_s + " km"
	end

end
