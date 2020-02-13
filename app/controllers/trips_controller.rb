class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @student = current_user
    @instructor = User.find(params[:user_id])
    # @booked_sessions = instructor_sessions(params[:user_id])
    @booked_slots = generate_booked_slots(params[:user_id])
    # @sessions = []
  end

  def create
    instructor_id = params[:user_id].to_i
    student_id = params[:trip][:student_id].to_i

    # Generate an array of all sessions (start times) already booked for this instructor
    booked_slots = generate_booked_slots(params[:user_id])
    # Log in an array all sessions (start times) selected by the user
    selected_slots = []
    if params[:trip][:sessions].nil?
      flash[:alert] = "Please select at least 1 hour"
    else
      params[:trip][:sessions].each do |key|
        selected_slots << key[0].to_datetime
      end
    end

    # Check there are no booking overlaps and create a trip + sessions if test is successful
    if confirm_no_booking_overlaps(selected_slots, booked_slots)
      trip = Trip.new(instructor_id: instructor_id, student_id: student_id)
      trip.save!
      selected_slots.each do |start_datetime|
        session = Session.new(trip_id: trip.id, start: start_datetime, end: start_datetime + 1.hour)
        session.save!
      end

      redirect_to edit_user_trip_path(user_id: instructor_id, id: trip.id)
    else
      flash[:notice] = "Couldn't be saved as some slot had been booked by another user in the meantime. Please load page again."
      render :new
    end
  end

  def edit
    @instructor = User.find(params[:user_id])
    @trip = Trip.find(params[:id])
    @sessions = Session.where(trip_id: @trip.id)
  end

  def update
    trip = Trip.find(params[:id])
    trip.status = 1
    trip.save
    sessions = Session.where(trip_id: trip.id)
    sessions.each do |session|
      session.status = 1
      session.save
    end
    redirect_to root_path
  end

  private

  def instructor_sessions(instructor_id)
    trips = Trip.where(instructor_id: instructor_id)
    sessions = trips.map do |trip|
      trip.sessions
    end
    sessions.flatten
    # filter and only show the booked ones
  end

  def trip_params
    params.require(:trip).permit(:all)
  end

  def confirm_no_booking_overlaps(selected_slots, booked_slots)
    combined_sessions = []
    combined_sessions + selected_slots + booked_slots
    combined_sessions.uniq.length == combined_sessions.length
  end

  def generate_booked_slots(instructor_id)
    booked_slots = []
    @booked_sessions = instructor_sessions(instructor_id)

    @booked_sessions.each do |session|
      booked_slots << session.start
    end
    booked_slots
  end
end
