class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :begin
      t.datetime :end
      t.integer :party_size

      t.timestamps
    end
  end
end
