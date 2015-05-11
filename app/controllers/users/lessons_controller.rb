class Users::LessonsController < ApplicationController
  before_action :authenticate_user!

  def index

    @lesson = Lesson.new
    @coach = current_user.coach
    @lessons = @coach.lessons.all.order("created_at DESC")
  end

  def create
    @coach = current_user.coach
    @lesson = @coach.lessons.create(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to users_coach_lessons_path }
        # format.js
      else
        format.html { render :action => "index" }
        # format.js
      end
    end
  end


  private

  def lesson_params
    params.require(:lesson).permit( :coach_id, :name, :suitable, :content, :min_price, :max_price, :attendance, :ps, :photo )
  end
end
