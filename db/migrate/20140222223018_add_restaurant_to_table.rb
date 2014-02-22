class AddRestaurantToTable < ActiveRecord::Migration
  def change
    add_reference :tables, :restaurant, index: true
  end
end
