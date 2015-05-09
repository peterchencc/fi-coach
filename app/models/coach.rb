class Coach < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/coach/default.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_uniqueness_of :user_id
  belongs_to :user

  has_many :coach_skillships
  has_many :skills, :through => :coach_skillships


  def skill_list
    self.skills.map{ |t| t.name }.join(",")
  end

  def skill_list=(value)
    skills = value.split(",").map { |skill_name|
      skill_name = skill_name.strip
      Skill.find_by_name(skill_name) || Skill.create( :name => skill_name)
    }

    self.skill_ids = skills.map{ |x| x.id }
  end

end
