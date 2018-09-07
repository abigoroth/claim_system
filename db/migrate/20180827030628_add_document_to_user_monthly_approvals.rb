class AddDocumentToUserMonthlyApprovals < ActiveRecord::Migration[5.2]
  def change
    add_column :user_monthly_approvals, :document, :string
  end
end
