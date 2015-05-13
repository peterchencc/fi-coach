class ApiV1::CoachesController < ApiController

  def index
    @coaches = Coach.all.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills)
  end

  def show
    @coach = Coach.find(params[:id])
  end

end
