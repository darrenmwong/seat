class RemoveAvailableTimesFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :available_times, :time
  end
end
