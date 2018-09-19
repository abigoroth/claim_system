class UserMonthlyApprovalPolicy < ApplicationPolicy
  def edit?
  	record.status == "Draft" || record.status == "Rejected"
  end
end