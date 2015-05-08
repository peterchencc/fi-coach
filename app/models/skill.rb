class Skill < ActiveRecord::Base

  has_many :coach_skillships
  has_many :coaches, :through => :coach_skillships

end
