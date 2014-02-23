class CreateReservTables < ActiveRecord::Migration
  def change
    create_table :reserv_tables do |t|
      t.references :reservation, index: true
      t.references :table, index: true

      t.timestamps
    end
  end
end
