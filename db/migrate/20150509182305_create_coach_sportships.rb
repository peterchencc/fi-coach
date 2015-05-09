class CreateCoachSportships < ActiveRecord::Migration
  def change
    create_table :coach_sportships do |t|
      t.integer :coach_id
      t.integer :sport_id
      t.timestamps null: false
    end
    add_index :coach_sportships, :coach_id
    add_index :coach_sportships, :sport_id
  end
end
