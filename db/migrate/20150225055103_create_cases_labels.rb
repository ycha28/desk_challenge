class CreateCasesLabels < ActiveRecord::Migration
  def change
    create_table :cases_labels do |t|
      t.integer :case_id
      t.integer :label_id
    end
  end
end
