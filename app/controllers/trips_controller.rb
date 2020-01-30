class TripsController < ApplicationController
  def new
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
    student_id = instructor_id + 1
    # num_students should be passed in params
    num_students = 2
    # note should be passed in params
    note = "Llorem ipsum Llorem ipsum Llorem ipsum Llorem ipsum"

    # check for each sessions
      # if start-datetime is available
      # else refuse Trip and session and show error message to user
    earliest_session = sessions_array.min
    latest_session = sessions_array.max
    @sessions = Session.where(start > earliest_session AND start < latest_session )


    # If all sessions are available
    trip = Trip.new(instructor_id: instructor_id, student_id: student_id, num_students: num_students, note: note)
    trip.save

    sessions_array.each do |start_datetime|
      session = Session.new(start: start_datetime, end: start_datetime + (1 / 24.0)) #last brackets add 1 hour to start_datetime
      session.save
    end
  end
end
