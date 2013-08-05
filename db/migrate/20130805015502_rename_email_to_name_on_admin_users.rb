class RenameEmailToNameOnAdminUsers < ActiveRecord::Migration
  def up
    rename_column :admin_users, :email, :name
  end

  def down
    rename_column :admin_users, :name, :email
  end
end
