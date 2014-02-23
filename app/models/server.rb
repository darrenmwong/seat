class Server < ActiveRecord::Base
  has_many :reservations, through: :reserv_serv
  has_many :reserv_servs
  belongs_to :restaurant

end
