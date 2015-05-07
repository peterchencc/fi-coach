class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :coach_name
      t.integer :user_id
      t.text :info
      t.text :description
      t.text :certificate
      t.text :teaching_frame
      t.string :contact_email
      t.string :contact_phone
      t.boolean :admin_check, null: false, default: false

      t.timestamps null: false
    end
    add_index :coaches, :user_id, unique: true
  end
end
