class Reservation < ActiveRecord::Base
  has_one :server, through: :reserv_serv
  has_one :reserv_serv
  has_many :reserv_tables
  has_many :tables, through: :reserv_table
  belongs_to :user
  belongs_to :restaurant
  
end
