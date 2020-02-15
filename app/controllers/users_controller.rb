class UsersController < ApplicationController
  def index
    # Add correct db search or add gem
    start_date = change_date_format(params[:start_date])
    end_date = change_date_format(params[:end_date])
    search
    @instructors = @available_instructors
    @instructors.each do |instructor|
      set_ratings_average(instructor)
    end
    session[:start_date] = start_date
    session[:end_date] = end_date
  end

  def show
    @instructor = User.find(params[:id])
    get_instructor_reviews(@instructor)
    get_instructor_photos(@instructor)
    set_ratings_average(@instructor)
  end


  private

  def search
    # Identify instructors that are not available
    start_date = change_date_format(params[:start_date])
    end_date = change_date_format(params[:end_date])

    sql = "SELECT DISTINCT(users.id)
    FROM users
    JOIN trips ON users.id = trips.instructor_id
    JOIN sessions ON trips.id = sessions.trip_id
    WHERE DATE(sessions.start) >= DATE('#{start_date}') AND DATE(sessions.end) <= DATE('#{end_date}')
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

  def get_instructor_reviews(instructor)
    @reviews = Review.where(instructor_id: instructor.id)
  end

  def get_instructor_photos(instructor)
     @photos = Photo.where(user_id: instructor.id)
  end

  def set_ratings_average(instructor)
    if instructor.reviews.count == 0
      instructor.ratings_average = 0
    else
      instructor.ratings_average = '%.1f' % instructor.count_ratings_average
    end
    instructor.save
  end

  def change_date_format(date)
    to_date = date.to_date
    new_format = to_date.strftime("%d-%m-%Y")
  end
end
