# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'

puts 'deleting all users, trips, sessions, reviews, images...'
Session.delete_all
Trip.delete_all
Review.delete_all
Photo.delete_all
User.delete_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'seed_users.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row.to_hash
  u = User.new
  u.first_name = row['first_name']
  u.last_name = row['last_name']
  u.description = row['description']
  u.gender = row['gender']
  u.resort = row['resort']
  u.role = row['role'].to_i
  u.hourly_rate_cents = row['hourly_rate_cents'].to_i
  u.email = row['email']
  u.password = row['password']
  u.avatar = row['avatar']
  puts u.valid?
  u.save
  puts "#{u.first_name}, #{u.last_name} saved"
end


csv_text = File.read(Rails.root.join('lib', 'seeds', 'seed_reviews.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row.to_hash
  r = Review.new
  r.instructor_id = row['instructor_id']
  r.rating = row['rating']
  r.description = row['description']
  puts r.valid?
  r.save
  puts "#{r.instructor_id}, #{r.rating}, #{r.description} saved"
end



p = Photo.new
p.url = 'seeds/2 - Carolin1.png'
p.user_id = 2
puts p.valid?
p.save

puts "The second end"


