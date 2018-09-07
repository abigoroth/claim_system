class AddUserMonthlyApprovalIdToExpenseEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :expense_entries, :user_monthly_approval_id, :integer
  end
end
