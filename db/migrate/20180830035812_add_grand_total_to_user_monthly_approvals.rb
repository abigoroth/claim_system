class AddGrandTotalToUserMonthlyApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_monthly_approvals, :grand_total, :decimal
  end
end
