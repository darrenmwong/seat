class CreateReservetables < ActiveRecord::Migration
  def change
    create_table :reservetables do |t|
      t.references :reservation, index: true
      t.references :table, index: true

      t.timestamps
    end
  end
end
