class AddRestaurantToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :restaurant, index: true
  end
end
