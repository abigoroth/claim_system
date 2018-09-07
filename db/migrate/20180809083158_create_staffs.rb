class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :position
      t.string :email
      t.string :phone
      t.string :password

      t.timestamps
    end
  end
end
