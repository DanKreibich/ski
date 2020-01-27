class UsersController < ApplicationController
  def index
    raise
  end

  def show
    @instructor = User.find(params[:id])
  end
end
