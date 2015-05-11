class AddPhotoToLesson < ActiveRecord::Migration
  def change
    add_attachment :lessons, :photo
  end
end
