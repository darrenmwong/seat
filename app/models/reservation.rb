class Reservation < ActiveRecord::Base
  belongs_to :server
  belongs_to :user
  belongs_to :restaurant
  has_many :tables, through: :reservetables
  has_many :reservetables
  
end
