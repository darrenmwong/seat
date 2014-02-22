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

r = Restaurant.create(name: "chipotle", num_of_tables: 1)
r = Restaurant.create(name: "joelsucks", num_of_tables: 2)

u = User.new(email: "darrenwong06@gmail.com", password: 123)
u.save!(:validate => false)

u.reservations.create(date: "2014-02-22", time_begin: "21:46:10", time_end: "23:00:00", party_size: 4)
u.reservations.create(date: "2014-11-12", time_begin: "21:46:10", time_end: "16:00:00", party_size: 3)

u.reservations.first.restaurant = Restaurant.first

u = User.new(email: "fnc314@gmail.com", password: 123, admin: true)
u.save!(:validate => false)

u.reservations.create(date: "2014-08-8", time_begin: "21:46:10", time_end: "08:00:00", party_size: 8)
u.reservations.create(date: "2015-12-8", time_begin: "22:46:10", time_end: "10:00:00", party_size: 13)

u.reservations.second.restaurant = Restaurant.second

u = User.new(email: "fnc314@gmail.com", password: 123, admin: true)
u.save!(:validate => false)

u.reservations.create(date: "2014-08-8", time_begin: "21:46:10", time_end: "08:00:00", party_size: 8)
u.reservations.create(date: "2015-12-8", time_begin: "22:46:10", time_end: "10:00:00", party_size: 13)



