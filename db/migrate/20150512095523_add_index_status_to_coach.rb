class AddIndexStatusToCoach < ActiveRecord::Migration
  def change
    add_index :coaches, :status
  end
end
