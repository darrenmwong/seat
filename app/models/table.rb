class Table < ActiveRecord::Base
  has_many :reservations, through: :reserv_tables #are we sure about this?
  has_many :reserv_tables 
  belongs_to :restaurant
end
