class AddDateToUserMonthlyApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_monthly_approvals, :date, :string
  end
end
