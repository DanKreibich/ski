class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @instructor = User.find(params[:user_id])
    @sessions = instructor_sessions(@instructor)
  end

  private

  def instructor_sessions(instructor)
    @trips = Trip.where(instructor_id: "#{instructor.id}")
    @sessions = []
    @trips.each do |trip|
      @sessions << Session.where(trip_id: "#{trip.id}")
    end
    @sessions
  end
end
