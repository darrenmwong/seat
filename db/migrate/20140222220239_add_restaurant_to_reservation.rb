class AddRestaurantToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :restaurant, index: true, default: 1
  end
end
