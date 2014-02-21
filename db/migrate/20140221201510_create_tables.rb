class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :capacity

      t.timestamps
    end
  end
end
