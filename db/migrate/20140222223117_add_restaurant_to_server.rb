class AddRestaurantToServer < ActiveRecord::Migration
  def change
    add_reference :servers, :restaurant, index: true
  end
end
