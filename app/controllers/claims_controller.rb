class ClaimsController < ApplicationController
  def index
	if params[:search]
		query_array = []
		if !params[:search][:month].blank?
			query_array.push("strftime('%m', created) = '#{params[:search][:month]}'")
		end
		if !params[:search][:year].blank?
			query_array.push("strftime('%Y' , created) = '#{params[:search][:year]}'")
		end
		@user_monthly_approvals = UserMonthlyApproval.where(query_array.join(" and "))
	else
		@user_monthly_approvals = UserMonthlyApproval.all
	end
  end
end
