class AddAvailableTimeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :available_time, :time
  end
end
