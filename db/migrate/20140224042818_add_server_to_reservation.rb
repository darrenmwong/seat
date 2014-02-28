class AddServerToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :server, index: true
  end
end
