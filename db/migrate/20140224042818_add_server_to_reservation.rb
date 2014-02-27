class AddServerToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :server, index: true, :default => 11
  end
end
