class Sport < ActiveRecord::Base

  has_many :coach_sportships
  has_many :coaches, :through => :coach_sportships

end
