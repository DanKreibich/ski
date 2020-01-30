class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @instructor = User.find(params[:user_id])
  end

  def create
  end
end
