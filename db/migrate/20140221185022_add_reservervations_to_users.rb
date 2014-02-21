class AddReservervationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reservation, :integer
  end
end
