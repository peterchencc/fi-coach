class City < ActiveRecord::Base

  has_many :coach_cityships
  has_many :coaches, :through => :coach_cityships

end
