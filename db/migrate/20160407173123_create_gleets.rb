class CreateGleets < ActiveRecord::Migration
  def change
    create_table :gleets do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
