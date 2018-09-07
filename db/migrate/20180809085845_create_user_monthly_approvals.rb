class CreateUserMonthlyApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_monthly_approvals do |t|
      t.date :created
      t.string :status

      t.timestamps
    end
  end
end
