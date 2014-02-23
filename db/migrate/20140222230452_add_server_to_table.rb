class AddServerToTable < ActiveRecord::Migration
  def change
    add_reference :tables, :server, index: true
  end
end
