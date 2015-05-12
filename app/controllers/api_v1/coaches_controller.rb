class ApiV1::CoachesController < ApiController

  def index
    @coaches = Coach.all.order("created_at DESC").includes(:sports, :certificates, :experiences, :lessons, :skills)
  end

  def show
    @coach = params[:id]
    render :partial => "api_v1/coaches/show.json"
  end

end
