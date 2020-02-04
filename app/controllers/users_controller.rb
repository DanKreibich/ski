class UsersController < ApplicationController
  def index
    if params[:query].present?

      # Add correct db search or add gem
    else
      @instructors = User.all
    end
  end

  def show
    @instructor = User.find(params[:id])
    @reviews = Review.where(instructor_id: @instructor.id)
    @photos = Photo.where(user_id: @instructor.id)
  end
end
