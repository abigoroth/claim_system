class RemoveDocumentFromUserMonthlyApproval < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_monthly_approvals, :document, :string
  end
end
