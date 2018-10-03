class UserMonthlyApprovalPolicy < ApplicationPolicy
  def edit?
  	record.status == "new" || record.status == "Rejected"
  end

  def user_claim?
  	Rails.logger.debug("USER POLICY CLAIM#{user.inspect}")
  	Rails.logger.debug("USER POLICY CLAIM RECORD#{record.inspect}")
  	Rails.logger.debug("USER POLICY CLAIM RECORD#{record.staff_id == user.id}")
  	user == record.staff
  end
end