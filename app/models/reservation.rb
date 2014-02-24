class Reservation < ActiveRecord::Base
  belongs_to :server
  belongs_to :user
  belongs_to :restaurant
  
end
