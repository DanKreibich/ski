class UsersController < ApplicationController
  def index
    # Add correct db search or add gem
    search
    @instructors = @available_instructors
    @instructors.each do |instructor|
      instructor.ratings_average = calculate_average(instructor)
      instructor.save
    end
    session[:start_date] = params[:start_date]
    session[:end_date] = params[:end_date]
  end

  def show
    @instructor = User.find(params[:id])
    get_instructor_reviews(@instructor)
    get_instructor_photos(@instructor)
    set_rating_average(@reviews)
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

  def get_instructor_reviews(instructor)
    @reviews = Review.where(instructor_id: instructor.id)
  end

  def get_instructor_photos(instructor)
     @photos = Photo.where(user_id: instructor.id)
  end

  def set_rating_average(reviews)
    @rating_average = reviews.sum(:rating) / reviews.count.to_f
  end

  def calculate_average(instructor)
    reviews = get_instructor_reviews(instructor)
    set_rating_average(reviews)
  end
end
