class AddSectionToTable < ActiveRecord::Migration
  def change
    add_column :tables, :section_id, :integer
  end
end
