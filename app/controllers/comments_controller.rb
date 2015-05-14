class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_coach

  def create

    @comment = @coach.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        set_coach
        # format.html { redirect_to coach_path(@coach) }
        format.js
      else
        format.html { render :template => "coaches/show" }
        format.js
      end
    end
  end

  def destroy
    @comment = @coach.comments.find( params[:id] )

    if @comment.can_delete_by?(current_user)
      @comment.destroy
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  protected

  def set_coach
    @coach = Coach.find(params[:coach_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end