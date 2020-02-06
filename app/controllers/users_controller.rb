class UsersController < ApplicationController
  def index
    search
    if @available_instructors
      @instructors = @available_instructors
    else
      @instructors = User.all
    end
  end

  def show
    @instructor = User.find(params[:id])
    @reviews = Review.where(instructor_id: @instructor.id)
    @photos = Photo.where(user_id: @instructor.id)
  end

  private

  def search
  #   location = params[:location]
  #   start_date = params[:start_date]
  #   end_date = params[:end_date]

  #   # identify instructors that are not available
  #   sql = "SELECT DISTINCT(users.id)
  #   FROM users
  #   JOIN trips ON users.id = trips.instructor_id
  #   JOIN sessions ON trips.id = sessions.trip_id
  #   WHERE DATE(sessions.start) >= DATE('#{start_date}') AND DATE(sessions.end) <= DATE('#{end_date}')
  #   GROUP BY DATE(sessions.start), users.id
  #   HAVING COUNT(sessions.id) >= 9"
  #   records_array = ActiveRecord::Base.connection.execute(sql) # executes SQL query above
  #   booked_instructor_ids = []
  #   records_array.each do |x|
  #     booked_instructor_ids << x["id"] # includes only instructors that can't be booked for the requested period
  #   end
  #   local_instructors = User.all.where(role: 1, resort: location) # all instructors in the requested location
  #   @available_instructors = local_instructors.reject { |instructor| booked_instructor_ids.include? instructor.id } # all instructors minus booked instructors
  end
end
