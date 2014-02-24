class Table < ActiveRecord::Base
  has_many :reservations, through: :reservetables #are we sure about this?
  has_many :reservetables
  belongs_to :restaurant
end
