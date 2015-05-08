class CoachesController < ApplicationController

  before_action :authenticate_user!, only: [ :new, :create, :edit, :update ]
  before_action :set_coach, :only => [ :show, :edit, :update, :destroy ]

  def index
    @coaches = Coach.all.order("created_at DESC")
  end

  def show
  end

  def new
    @coach = Coach.new
    if current_user.is_coach?

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

  def edit
    unless current_user.id == @coach.user_id
      redirect_to coaches_path
    end
  end

  def update
    if @coach.update( coach_params )
      flash[:notice] = "編輯成功"
      redirect_to coaches_path
    else
      render :action => :edit
    end
  end

  def destroy
    @coach.destroy
    flash[:alert] = "Done 刪除!!"
    redirect_to coaches_path
  end


  private

  def set_coach
    @coach = Coach.find( params[:id] )
  end

  def coach_params
    params.require(:coach).permit( :coach_name, :user_id, :info, :description, :certificate, :teaching_frame, :contact_email, :contact_phone, :photo )
  end
end
