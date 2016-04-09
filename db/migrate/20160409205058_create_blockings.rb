class CreateBlockings < ActiveRecord::Migration
  def change
    create_table :blockings do |t|
      t.integer :blocker_id
      t.integer :blocked_id

      t.timestamps null: false
    end
    add_index :blockings, :blocker_id
    add_index :blockings, :blocked_id
    add_index :blockings, [:blocker_id, :blocked_id], unique: true
  end
end
