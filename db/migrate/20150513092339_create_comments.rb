class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :coach_id, null: false
      t.integer :lesson_id
      t.string :content, null: false
      t.integer :rating
      t.timestamps null: false
    end
    add_index :comments, :user_id
    add_index :comments, :coach_id
    add_index :comments, :rating
  end
end
