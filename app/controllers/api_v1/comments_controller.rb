class ApiV1::CommentsController < ApiController

  before_action :authenticate_user!
  before_action :set_coach

  def create

    @comment = Comment.new(content: params[:content],
                            rating: params[:rating],
                          coach_id: params[:coach_id])

    @comment.user = current_user


    if @comment.save
      render :json => { :message => "Ok",
                        :auth_token => current_user.authentication_token,
                        :comment_id => @comment.id }
    else
      render :json => { :message => "Create comment failed" }, :status => 401
    end

  end

  protected

  def set_coach
    @coach = Coach.find(params[:coach_id])
  end

end