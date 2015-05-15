class CoachesController < ApplicationController

  before_action :set_coach, :only => :show

  def landing
    @coach = Coach.new
  end

  def index
    if params[:sports]
      sport = Sport.find_by_name(params[:sports])
      @coaches = sport.coaches.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills)
    else
      @coaches = Coach.all.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills)
    end
    @coaches_all = Coach.count
    @sports = Sport.all
  end

  def show
    @comment = Comment.new
  end

  private

  def set_coach
    @coach = Coach.find( params[:id] )
  end
end
