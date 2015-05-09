class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :coach_id, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :experiences, :coach_id
  end
end
