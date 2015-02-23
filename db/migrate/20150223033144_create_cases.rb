class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :service_id
      t.text :blurb
      t.string :subject
      t.integer :priority
      t.text :description
      t.string :status
      t.string :type
      t.datetime :changed_at
      t.datetime :active_at
      t.datetime :received_at
      t.datetime :locked_until
      t.datetime :first_oened_at
      t.datetime :opened_at
      t.datetime :first_resolved_at
      t.datetime :resolved_at
    end
  end
end
