class AddCompanyIdToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :company_id, :integer
  end
end
