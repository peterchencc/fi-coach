class AddIndexFbUidToUsers < ActiveRecord::Migration
  def change
    add_index :users, :fb_uid
  end
end
