class CreateCoachCityships < ActiveRecord::Migration
  def change
    create_table :coach_cityships do |t|
      t.integer :coach_id
      t.integer :city_id
      t.timestamps null: false
    end
    add_index :coach_cityships, :coach_id
    add_index :coach_cityships, :city_id
  end
end
