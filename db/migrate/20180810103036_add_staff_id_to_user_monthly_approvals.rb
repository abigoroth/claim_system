class AddStaffIdToUserMonthlyApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_monthly_approvals, :staff_id, :integer
  end
end
