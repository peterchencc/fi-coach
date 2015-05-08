class AddAvatarToCoach < ActiveRecord::Migration
  def change
    add_attachment :coaches, :photo
  end
end
