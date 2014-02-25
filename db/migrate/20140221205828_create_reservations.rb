class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :begin
      t.datetime :end
      t.integer :party_size, default: 1

      t.timestamps
    end
  end
end
