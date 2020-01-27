class UsersController < ApplicationController
  def index
  end

  def show
    @instructor = User.find(params[:id])
  end
end
