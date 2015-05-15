class ApiV1::CoachesController < ApiController

  def index
    if params[:sports]
      sport = Sport.find_by_id(params[:sports])
      @coaches = sport.coaches.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills, :cities)
    elsif params[:city]
      city = City.find_by_id(params[:city])
      @coaches = city.coaches.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills, :cities)
    elsif
      @coaches = Coach.all.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills, :cities)
    end
  end

  def show
    @coach = Coach.find(params[:id])
  end

end
