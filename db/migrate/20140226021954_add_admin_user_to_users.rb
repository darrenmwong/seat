class AddAdminUserToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :admin_user, index: true
  end
end
