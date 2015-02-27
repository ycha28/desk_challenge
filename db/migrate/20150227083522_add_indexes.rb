class AddIndexes < ActiveRecord::Migration
  def change
    add_index :cases, :service_id, unique: true
    add_index :filters, :service_id, unique: true
    add_index :labels, :service_id, unique: true
    add_index :messages, :case_id, unique: true
  end
end
