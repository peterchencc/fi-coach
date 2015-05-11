class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :coach_id, null: false
      t.string :name, null: false
      t.string :suitable
      t.text :content
      t.float :min_price
      t.float :max_price
      t.string :attendance
      t.string :ps

      t.timestamps null: false
    end
    add_index :lessons, :coach_id
  end
end
