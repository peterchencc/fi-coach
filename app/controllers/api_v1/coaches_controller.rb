class ApiV1::CoachesController < ApiController

  def index
    @coaches = Coach.all.order("created_at DESC")
  end

  def show
    @i = params[:id]
    render :partial => "api_v1/coaches/show.json"
  end

end
