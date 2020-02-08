class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @student = current_user
    @instructor = User.find(params[:user_id])
    @booked_sessions = instructor_sessions(@instructor)
    3.times { @trip.sessions.build }

    @sessions = []
  end

  def create

    # the following list depicts what is expected to be received. Needs to be renamed ones real data comes
    selected_sessions_array = []
    params[:trip][:sessions].each do |key|
      selected_sessions_array << key[0].to_datetime
    end
    # instructor_id should be passed in params
    instructor_id = params[:user_id].to_i
    # student_id should be passed in params
    student_id = params[:trip][:student_id].to_i
    # num_students should be passed in params
    num_students = 2
    # note should be passed in params
    note = "Llorem ipsum Llorem ipsum Llorem ipsum Llorem ipsum"
    # do a check if all sessions are still available
    @instructor = User.find(instructor_id)
    student = User.find(student_id)
    @trips = Trip.where(instructor_id: instructor_id)

    @booked_sessions = [] # for all trips that have been already booked by other users
    booked_sessions_starts = [] # are all the start times of booked_sessions

    @trips.each do |trip|
      booked_sessions = Session.where(trip_id: trip.id).to_a
      booked_sessions.each do |session|
        booked_sessions_starts << session.start
      end
    end

    combined_sessions = []
    combined_sessions += selected_sessions_array
    combined_sessions += booked_sessions_starts # combines already booked sessions with requested sessions
    if combined_sessions.uniq.length == combined_sessions.length # checks if there are overlaps
      trip = Trip.new(instructor_id: instructor_id, student_id: student_id, num_students: num_students, note: note)
      trip.save!

      selected_sessions_array.each do |start_datetime|
        session = Session.new(trip_id: trip.id, start: start_datetime, end: start_datetime + 1.hour)
        session.save!
      end
      redirect_to user_path(@instructor)
    else
      flash[:notice] = "Couldn't be saved as some slot had been booked by another user in the meantime. Please load page again."
    end

  end


  private

  def instructor_sessions(instructor)
    @trips = Trip.where(instructor_id: instructor.id)
    @sessions = []
    @trips.each do |trip|
      @sessions << Session.where(trip_id: trip.id)
    end
    @sessions
  end

  def trip_params
    params.require(:trip).permit(:all)
  end
end
