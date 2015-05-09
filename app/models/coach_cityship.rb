class CoachCityship < ActiveRecord::Base
  belongs_to :city
  belongs_to :coach
end
