class ChangeColumnDefaultStatusUma < ActiveRecord::Migration[5.2]
  def change
	change_column_default :user_monthly_approvals, :status, "new"
  end
end
