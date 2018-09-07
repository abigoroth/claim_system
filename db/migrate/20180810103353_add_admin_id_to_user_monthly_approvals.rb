class AddAdminIdToUserMonthlyApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_monthly_approvals, :admin_id, :integer
  end
end
