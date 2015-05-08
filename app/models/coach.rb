class Coach < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/coach/default.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_uniqueness_of :user_id
  belongs_to :user

end
