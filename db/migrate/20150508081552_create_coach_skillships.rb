class CreateCoachSkillships < ActiveRecord::Migration
  def change
    create_table :coach_skillships do |t|
      t.integer :coach_id
      t.integer :skill_id
      t.timestamps null: false
    end
    add_index :coach_skillships, :coach_id
    add_index :coach_skillships, :skill_id
  end
end
