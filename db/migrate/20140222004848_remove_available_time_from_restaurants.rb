class RemoveAvailableTimeFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :available_time, :time
  end
end
