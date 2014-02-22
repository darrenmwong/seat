class ReservTable < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :table
end
