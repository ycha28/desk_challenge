class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :case_id
      t.text :body
      t.datetime :remote_created_at
    end
  end
end
