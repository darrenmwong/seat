class ReservServ < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :server
end
