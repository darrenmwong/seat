class Table < ActiveRecord::Base
  has_many :reservations #are we sure about this?
  belongs_to :server #questioned off 
  belongs_to :restaurant
end
