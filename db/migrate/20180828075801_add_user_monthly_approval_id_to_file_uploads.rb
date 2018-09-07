class AddUserMonthlyApprovalIdToFileUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :file_uploads, :user_monthly_approval_id, :integer
  end
end
