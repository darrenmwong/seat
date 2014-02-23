class CreateReservServs < ActiveRecord::Migration
  def change
    create_table :reserv_servs do |t|
      t.references :reservation, index: true
      t.references :server, index: true

      t.timestamps
    end
  end
end
