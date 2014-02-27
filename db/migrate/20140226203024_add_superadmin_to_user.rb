class AddSuperadminToUser < ActiveRecord::Migration
  def up
    add_column :users, :superadmin, :boolean, :null => false, :default => false
  end
end
