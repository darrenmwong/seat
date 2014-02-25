class AddRestaurantToServer < ActiveRecord::Migration
  def change
    add_reference :servers, :restaurant, index: true, default: 1
  end
end
