class Comment < ActiveRecord::Base
  validates_presence_of :content, :user_id, :coach_id
  belongs_to :coach
  belongs_to :user

  def can_delete_by?(u)
    self.user == u
  end
end
