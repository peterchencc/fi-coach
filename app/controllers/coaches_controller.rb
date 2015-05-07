class CoachesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @coaches = Coach.all
  end
  def show

  end

  def new
    @coach = Coach.new
    if current_user.not_coach

    else
      flash[:alert] = "一個帳號只能一個教練喔"
      redirect_to coaches_path
    end
  end

  def create

    @coach = current_user.create_coach(coach_params)

    if @coach.save
      flash[:notice] = "新增成功"
      redirect_to coaches_path
    else
      flash[:alert] = "一個帳號只能一個教練喔"
      render :new
    end
  end


  private

  def coach_params
    params.require(:coach).permit( :coach_name, :user_id, :info, :description, :certificate, :teaching_frame, :contact_email, :contact_phone )
  end
end
