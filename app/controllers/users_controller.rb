class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    if current_user.is_coach?
      @coach = Coach.new
    end
  end
end
