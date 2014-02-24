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
    Restaurant.first.tables.create(capacity: 2, server_id: 1)
    i+=1
  else
    Restaurant.first.tables.create(capacity: 4, server_id: 2)
    i+=1
  end
end

Restaurant.first.servers.create(name: "Joan", restaurant_id: 1)
Restaurant.first.servers.create(name: "Jim", restaurant_id: 1)



