class AddFilterIdToCases < ActiveRecord::Migration
  def change
    add_column :cases, :filter_id, :integer
  end
end
