class ServerTable < ActiveRecord::Base
  belongs_to :server
  belongs_to :table
end
