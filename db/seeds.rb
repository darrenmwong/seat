# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.
# puts 'ROLES'
# YAML.load(ENV['ROLES']).each do |role|
#   Role.find_or_create_by_name(role)
#   puts 'role: ' << role
# end
# puts 'DEFAULT USERS'
# user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name
# user.confirm!
# user.add_role :admin

User.create!(name: "Darren", email: "darrenwong06@gmail.com", password: 1234567890, phone_number: "9163976614", password_confirmation: 1234567890, superadmin: true)
User.create!(name: "Franco", email: "fnc314@gmail.com", phone_number: "4127219550", password: 1234567890, password_confirmation: 1234567890, superadmin: true)
User.create!(name: "Jackson", email: "jacksonsandland@gmail.com", phone_number: "8585279771", password: 1234567890, password_confirmation: 1234567890, superadmin: true)
User.create!(name: "Brian", email: "brianwong06@gmail.com", password: 123456789, phone_number: "9163976614", password_confirmation: 123456789, superadmin: false)
User.create!(name: "Franco", email: "fnc314@email.com", phone_number: "4127219550", password: 123456789, password_confirmation: 123456789, superadmin: false)
User.create!(name: "Jack", email: "jacksonsandland@email.com", phone_number: "8585279771", password: 123456789, password_confirmation: 123456789, superadmin: false)


Restaurant.create(name: "Alexander's", num_of_tables: 30)

(1..10).each do
  section = (1..5).to_a.sample
  Table.create(capacity: 2, section_id: section)
end

(1..20).each do
  section = (1..5).to_a.sample
  Table.create(capacity: 4, section_id: section)
end

Server.create(name: "Joan")
Server.create(name: "Jim")
Server.create(name: "Darren")
Server.create(name: "Franco")
Server.create(name: "Jackson")
Server.create(name: "Stephanie")
Server.create(name: "Nina")
Server.create(name: "Simone")
Server.create(name: "Robert")
Server.create(name: "Tripta")

Reservation.create(
  user_id: 4,
  server_id: 9,
  :begin => DateTime.new(2014, 03, 01, 19, 30),
  :end => DateTime.new(2014, 03, 01, 21, 00),
  party_size: 3,
  table_ids: [16])

Reservation.create(
  user_id: 5,
  server_id: 7,
  :begin => DateTime.new(2014, 03, 01, 20, 00),
  :end => DateTime.new(2014, 03, 01, 21, 30),
  party_size: 1,
  table_ids: [1])

Reservation.create(
  user_id: 6,
  server_id: 1,
  :begin => DateTime.new(2014, 03, 01, 18, 00),
  :end => DateTime.new(2014, 03, 01, 19, 30),
  party_size: 16,
  table_ids: [26,27,28,29])

(1..30).each do 
  # Create "random" DateTime object data
  hour = [18, 19, 20, 21].sample
  minutes = [00, 30].sample
  year = [2014, 2013, 2015].sample
  month = (1..12).to_a.sample
  day = (1..28).to_a.sample
  # Create "random" user data
  userid = (4..6).to_a.sample
  # Create "random" party size
  partysize = (1..24).to_a.sample
  # Assign a server at "random"
  serverid = (1..10).to_a.sample
  res = Reservation.new
  res.party_size = partysize
  res.user_id = userid
  res.begin = DateTime.new(year, month, day, hour, minutes)
  res.end = res.begin + 90.minutes
  res.server_id = serverid
  res.save
end
