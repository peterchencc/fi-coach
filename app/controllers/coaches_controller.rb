class CoachesController < ApplicationController

  before_action :set_coach, :only => :show

  def index
    @coaches = Coach.all.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills)
  end

  def show
  end

  private

  def set_coach
    @coach = Coach.find( params[:id] )
  end
end
