# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'deleting all trips and sessions...'
Session.delete_all
Trip.delete_all

puts 'deleting all existing users...'
User.delete_all

20.times do
  instructor = User.new
  instructor.first_name = Faker::Name.first_name
  instructor.last_name = Faker::Name.last_name
  instructor.email = Faker::Internet.email
  instructor.password = 'VladIsBeautiful'
  instructor.gender = Faker::Gender.binary_type
  instructor.phone = Faker::PhoneNumber.cell_phone_with_country_code
  instructor.description = Faker::Lorem.sentence(word_count: 50)
  instructor.min_booking_hours = rand(1..4)
  instructor.level = ["expert","professional"].shuffle.first
  instructor.hourly_rate = rand(25..120)
  instructor.day_rate = instructor.hourly_rate * 6
  instructor.resort = ["St. Moritz, CH", "Lenzerheide, CH", "Sölden, AT", "Kitzbühel, AT"].shuffle.first
  instructor.avatar = 'https://source.unsplash.com/1600x900/?portrait,winter'
  instructor.max_num_students = rand(1..16)
  instructor.birth_date = Faker::Date.birthday(min_age: 18, max_age: 65)
  instructor.role = rand(0..1)
  instructor.save!
end
puts 'Created 20 users.'

trip = Trip.new
trip.instructor_id = User.first.id
trip.student_id = User.first.id + 1
trip.num_students = 2
trip.note = "Please be nice, Vlad. I need a good russian ski instructor"
trip.created_at = "2020-01-01T04:05:06+00:00"
trip.updated_at = "2020-01-01T04:05:06+00:00"
trip.save!

puts "Created a Trip for student (User ID:#{User.first.id + 1}) booking instructor (User ID:#{User.first.id})"


today = Date.today
trip_id = Trip.first.id

session = Session.new
session.start = "#{today + 1} 09:00:00 UTC +00:00".to_datetime
session.end = "#{today + 1} 10:00:00 UTC +00:00".to_datetime
session.trip_id = trip_id
trip.created_at = "2020-01-02T04:05:06+00:00"
trip.updated_at = "2020-01-02T04:05:06+00:00"
session.save!

session = Session.new
session.start = "#{today + 2} 11:00:00 UTC +00:00".to_datetime
session.end = "#{today + 2} 14:00:00 UTC +00:00".to_datetime
session.trip_id = trip_id
trip.created_at = "2020-01-02T04:05:06+00:00"
trip.updated_at = "2020-01-02T04:05:06+00:00"
session.save!

session = Session.new
session.start = "#{today + 3} 10:00:00 UTC +00:00".to_datetime
session.end = "#{today + 3} 15:00:00 UTC +00:00".to_datetime
session.trip_id = trip_id
trip.created_at = "2020-01-02T04:05:06+00:00"
trip.updated_at = "2020-01-02T04:05:06+00:00"
session.save!

puts "Created three sessions for Trip_id: #{trip_id}"
