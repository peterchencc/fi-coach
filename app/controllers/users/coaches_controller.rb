class Users::CoachesController < ApplicationController
  before_action :authenticate_user!

  def new
    @coach = Coach.new
    if current_user.is_coach?

    else
      flash[:alert] = "一個帳號只能一個教練喔"
      redirect_to users_path
    end
  end

  def create
    @coach = current_user.create_coach(coach_params)
    if @coach.save
      flash[:notice] = "在這邊可以編輯教練資料。"
      redirect_to edit_users_coach_path
    else
      flash[:alert] = "一個帳號只能一個教練喔"
      redirect_to users_path
    end
  end

  def edit
    redirect_to users_path if current_user.is_coach?
    @coach = current_user.coach
  end

  def update
    redirect_to users_path if current_user.is_coach?

    @coach = current_user.coach

    if @coach.update( coach_params )
      flash[:notice] = "編輯成功"
      redirect_to edit_users_coach_path
    else
      render :action => :edit
    end
  end

  def destroy
    @coach.destroy
    flash[:alert] = "Done 刪除!!"
    redirect_to coaches_path
  end

  def status
    @coach = current_user.coach
    if @coach.status == 'draft'
      @coach.status = 'public'
      @coach.save!
    else
      @coach.status = 'draft'
      @coach.save!
    end

    render :action => "status"
  end


  private

  def coach_params
    params.require(:coach).permit( :coach_name, :user_id, :status, :sex, :description,
      :teaching_frame, :contact_email, :contact_phone, :photo, :skill_list, :city_ids=> [], :sport_ids=> [],
      :experiences_attributes => [:name,:_destroy,:id], :certificates_attributes => [:name,:_destroy,:id]
      )
  end
end