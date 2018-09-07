class RemovePasswordFromStaffs < ActiveRecord::Migration[5.2]
  def change
	remove_column :staffs, :password, :string
  end
end
