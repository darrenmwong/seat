class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time_begin
      t.time :time_end
      t.integer :party_size

      t.timestamps
    end
  end
end
