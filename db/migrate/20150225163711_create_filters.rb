class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.integer :service_id
      t.boolean :active
      t.string :name
      t.integer :position
    end
  end
end
