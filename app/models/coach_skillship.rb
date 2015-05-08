class CoachSkillship < ActiveRecord::Base
  belongs_to :skill
  belongs_to :coach
end
