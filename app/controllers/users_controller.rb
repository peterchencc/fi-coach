class UsersController < ApplicationController
  def show
    @coach = Coach.new
  end
end
