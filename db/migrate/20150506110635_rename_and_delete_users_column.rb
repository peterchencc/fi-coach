class RenameAndDeleteUsersColumn < ActiveRecord::Migration
  def change
    remove_column :users, :provider
    rename_column :users, :uid, :fb_uid

    add_column :users, :fb_access_token, :string
    add_column :users, :fb_expires_at, :datetime
  end
end
