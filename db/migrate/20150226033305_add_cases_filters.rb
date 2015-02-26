class AddCasesFilters < ActiveRecord::Migration
  def change
    create_table :cases_filters do |t|
      t.integer :case_id
      t.integer :filter_id
    end
  end
end
