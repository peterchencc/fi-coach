class Users::LessonsController < ApplicationController
  before_action :authenticate_user!

  def index

    @lesson = Lesson.new

    @lessons = current_user.coach.lessons.all.order("created_at DESC")
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update( lesson_params )
      # flash[:notice] = "編輯成功"
      redirect_to users_coach_lessons_path
    else
      render :action => :edit
    end
  end

  def create
    @coach = current_user.coach
    @lesson = @coach.lessons.create(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to users_coach_lessons_path }
        # format.js
      else
        @coach = current_user.coach
        @lessons = @coach.lessons.all.order("created_at DESC")
        format.html { render :action => "index" }
        # format.js
      end
    end
  end

  def destroy
    @coach = current_user.coach
    @lesson = @coach.lessons.find(params[:id])

    @lesson.destroy
  end

  private

  def lesson_params
    params.require(:lesson).permit( :coach_id, :name, :suitable, :content, :min_price, :max_price, :attendance, :ps, :photo )
  end
end
