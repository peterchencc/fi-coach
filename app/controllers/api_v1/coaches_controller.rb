class ApiV1::CoachesController < ApiController

  def index
    if params[:sports]
      sport = Sport.find_by_id(params[:sports])
      @coaches = sport.coaches
    elsif params[:city]
      city = City.find_by_id(params[:city])
      @coaches = city.coaches
    elsif
      @coaches = Coach.all
    end

    @coaches = @coaches.where( :status => 'public' ).order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills, :cities)
  end

  def show
    @coach = Coach.find(params[:id])
  end

end
