class CoachesController < ApplicationController

  before_action :set_coach, :only => :show

  def landing
    @coach = Coach.new
  end

  def index
    @coaches = Coach.all.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills)
  end

  def show
    @comment = Comment.new
  end

  private

  def set_coach
    @coach = Coach.find( params[:id] )
  end
end
