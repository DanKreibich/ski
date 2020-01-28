class UsersController < ApplicationController
  def index
    if params[:query].present?
      # Add correct db search or add gem
    else
      @instructors = User.all
    end
  end

  def show
    # @instructor = User.find(params[:id])
  end
end
