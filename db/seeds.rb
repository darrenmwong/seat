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
Restaurant.create(name: "Alexander's", num_of_tables: 50)

i=0
while i < Restaurant.first.num_of_tables
  if i % 2 == 0
    Table.create(capacity: 2, server_id: 1, restaurant_id: 1)
    i+=1
  else
    Table.create(capacity: 4, server_id: 2, restaurant_id: 1)
    i+=1
  end
end

Server.create(name: "Joan", restaurant_id: 1)
Server.create(name: "Jim", restaurant_id: 1)

Reservation.create(date: "2014-03-14", time_begin: "18:30:00", time_end: "20:00:00", party_size: 5, user_id: 1, restaurant_id: 1)
Reservation.create(date: "2014-04-13", time_begin: "17:30:00", time_end: "19:00:00", party_size: 2, user_id: 1, restaurant_id: 1)

# Reserv_serv.create(reservation_id: 1, server_id: 1)
# Reserv_serv.create(reservation_id: 2, server_id: 2)

# Reserv_table.create(reservation_id: 1, table_id: 1)
# Reserv_table.create(reservation_id: 1, table_id: 3)
# Reserv_table.create(reservation_id: 2, table_id: 2)

