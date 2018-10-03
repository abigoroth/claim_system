class ClaimsController < ApplicationController
  def index
	if params[:search]
		query_array = []
		Rails.logger.debug("SEARCHED=====>#{params[:search]}")
		date = Date.parse("#{params[:search]}", "%m/%d/%Y")
		Rails.logger.debug("Parse to Date=====>#{date}")
		@user_monthly_approvals = UserMonthlyApproval.where(created: date)
		#if !params[:search][:month].blank?
		#	query_array.push("strftime('%m', created) = '#{params[:search][:month]}'")
		#end
		#if !params[:search][:year].blank?
			#query_array.push("strftime('%Y' , created) = '#{params[:search][:year]}'")
		#end
		#@user_monthly_approvals = UserMonthlyApproval.where(query_array.join(" and "))
	else
		if current_staff.admin == true 
			@user_monthly_approvals = UserMonthlyApproval.all
			
		else
			@user_monthly_approvals = UserMonthlyApproval.where(staff_id: current_staff.id)
		end
	end
	end
 
end
