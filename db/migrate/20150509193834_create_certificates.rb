class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.integer :coach_id, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :certificates, :coach_id
  end
end
