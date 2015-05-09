class CoachSportship < ActiveRecord::Base
  belongs_to :sport
  belongs_to :coach
end
