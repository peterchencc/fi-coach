class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all.order("created_at DESC")
  end

end
