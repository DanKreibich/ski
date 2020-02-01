class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @instructor = User.find(params[:user_id])
    @sessions = instructor_sessions(@instructor)
  end

  def create
    # temporary data
    today = Date.today
    session_one = "#{today + 1} 09:00:00 UTC +00:00".to_datetime
    session_two = "#{today + 2} 09:00:00 UTC +00:00".to_datetime
    session_three = "#{today + 3} 09:00:00 UTC +00:00".to_datetime

    # the following list depicts what is expected to be received. Needs to be renamed ones real data comes
    sessions_array = [session_one, session_two, session_three]
    # instructor_id should be passed in params
    instructor_id = User.first.id + 3
    # student_id should be passed in params
    student_id = instructor.id + 1
    # num_students should be passed in params
    num_students = 2
    # note should be passed in params
    note = "Llorem ipsum Llorem ipsum Llorem ipsum Llorem ipsum"

    # do a check if all sessions are still available
    instructor = User.find(params[:user_id])
    student_id = instructor.id + 1 # !!!!!!!!!! Needs to be adjusted with live data
    trips = Trip.where(instructor_id: instructor.id)

    booked_sessions = [] # for all trips that have been already booked by other users
    sessions_starts = [] # are all the start times of booked_sessions

    trips.each do
      booked_sessions += Session.where(trip_id: trip.id).to_a
      booked_sessions.each do |session|
        sessions_starts << session.start
      end
    end

    sessions_array += sessions_starts # combines already booked sessions with requested sessions

    if sessions_array.uniq.length == sessions_array.length # checks if there are overlaps
      trip = Trip.new(instructor_id: instructor_id, student_id: student_id, num_students: num_students, note: note)
      trip.save!

      sessions_array.each do |start_datetime|
        session = Session.new(trip_id: trip.id, start: start_datetime, end: start_datetime + (1 / 24.0)) #last brackets add 1 hour to start_datetime
        session.save!
      end
    else
      flash[:notice] = "Couldn't be saved as some slot had been booked by another user in the meantime. Please load page again."
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

end
