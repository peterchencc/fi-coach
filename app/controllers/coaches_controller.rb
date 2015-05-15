class CoachesController < ApplicationController

  before_action :set_coach, :only => :show

  def landing

  end

  def index

    @coaches = Coach.all
    if params[:sports]
      sport = Sport.find_by_name(params[:sports])
      unless sport.nil?
        @coaches = sport.coaches
      end
    end


    if params[:sex] == 'all'

    elsif params[:sex]
      @coaches = @coaches.where( :sex => params[:sex] )
    end

    if params[:city]
      city = City.find_by_name(params[:city])
      unless city.nil?
        @coaches = city.coaches
      end
     end

    @coaches = @coaches.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills, :cities)



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
