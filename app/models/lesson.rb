class Lesson < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/lesson/default.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :name
  belongs_to :coach

end
