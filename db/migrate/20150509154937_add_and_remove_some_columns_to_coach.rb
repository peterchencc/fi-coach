class AddAndRemoveSomeColumnsToCoach < ActiveRecord::Migration
  def change
    remove_column :coaches, :certificate
    remove_column :coaches, :info

    add_column :coaches, :status, :string, :default => "draft"
    add_column :coaches, :sex, :string, :limit => 1

  end
end
