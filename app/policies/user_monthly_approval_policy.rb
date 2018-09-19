class UserMonthlyApprovalPolicy < ApplicationPolicy
  def edit?
  	record.status == "new" || record.status == "Rejected"
  end

  def user_claim?
  	user == record.staff_id
  end
end