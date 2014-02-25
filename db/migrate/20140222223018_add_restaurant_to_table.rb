class AddRestaurantToTable < ActiveRecord::Migration
  def change
    add_reference :tables, :restaurant, index: true, default: 1
  end
end
