class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps null: false
    end
  end
end
