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

User.create(name: "Darren", email: "darrenwong06@gmail.com", password: 123456789, phone_number: "9163976614", password_confirmation: 123456789, superadmin: true)
User.create(name: "Franco", email: "fnc314@gmail.com", phone_number: "4127219550", password: 123456789, password_confirmation: 123456789, superadmin: true)
User.create(name: "Jackson", email: "jacksonsandland@gmail.com", phone_number: "8585279771", password: 123456789, password_confirmation: 123456789, superadmin: true)
User.create(name: "Brian", email: "brianwong06@gmail.com", password: 123456789, phone_number: "9163976614", password_confirmation: 123456789, superadmin: false)
User.create(name: "Franco", email: "not_admin@email.com", phone_number: "4127219550", password: 123456789, password_confirmation: 123456789, superadmin: false)
User.create(name: "Jack", email: "not_admin2@email.com", phone_number: "8585279771", password: 123456789, password_confirmation: 123456789, superadmin: false)


Restaurant.create(name: "Alexander's", num_of_tables: 30)

(1..10).each do
  Table.create(capacity: 2)
end

(1..20).each do
  Table.create(capacity: 4)
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

(1..30).each do |x|
  hour = [18, 19, 20, 21].sample
  minutes = [00, 30].sample
  res = Reservation.new
  if x % 3 == 1
    res.party_size = (x ** 2) % 24
    res.user_id = x % 3
    res.begin = DateTime.new(2014, (x % 12) + 1, x, hour, minutes)
    res.end = res.begin + 90.minutes
    res.save
  elsif x % 3 == 2
    res.party_size = (x ** 2) % 24
    res.user_id = x % 3
    res.begin = DateTime.new(2014, (x % 12) + 1, x, hour, minutes)
    res.end = res.begin + 90.minutes
    res.save
  else
    res.party_size = (x ** 2) % 24
    res.user_id = (x % 3) + 3
    res.begin = DateTime.new(2014, (x % 12) + 1, x, hour, minutes)
    res.end = res.begin + 90.minutes
    res.save
  end
end
