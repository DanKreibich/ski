class UsersController < ApplicationController
  def index
    # Add correct db search or add gem
    search
    if @available_instructors.empty?
      @instructors = User.all
    else
      @instructors = @available_instructors
      # should actually return "empty state" screen: "no instructors available for your query"
    end
  end

  def show
    @instructor = User.find(params[:id])
    @reviews = Review.where(instructor_id: @instructor.id)
    @photos = Photo.where(user_id: @instructor.id)
  end

  private

  def search
    # Identify instructors that are not available
    sql = "SELECT DISTINCT(users.id)
    FROM users
    JOIN trips ON users.id = trips.instructor_id
    JOIN sessions ON trips.id = sessions.trip_id
    WHERE DATE(sessions.start) >= DATE('#{params[:start_date]}') AND DATE(sessions.end) <= DATE('#{params[:end_date]}')
    GROUP BY DATE(sessions.start), users.id
    HAVING COUNT(sessions.id) >= 9"
    records_array = ActiveRecord::Base.connection.execute(sql) # executes SQL query above
    booked_instructor_ids = []
    records_array.each do |x|
      booked_instructor_ids << x["id"] # includes only instructors that can't be booked for the requested period
    end
    local_instructors = User.all.where(role: 1, resort: params[:location]) # all instructors in the requested location
    @available_instructors = local_instructors.reject { |instructor| booked_instructor_ids.include? instructor.id } # all instructors minus booked instructors
  end
end
