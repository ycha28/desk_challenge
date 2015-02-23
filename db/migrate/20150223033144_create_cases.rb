class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :service_id
      t.text :blurb
      t.string :subject
      t.integer :priority
      t.text :description
      t.string :status
      t.datetime :changed_at
    end
  end
end
