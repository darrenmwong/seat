class AddAvailableTimesToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :available_times, :time
  end
end
