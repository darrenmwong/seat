class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :tables
  has_many :servers
  # admin?
end
