class Table < ActiveRecord::Base
  has_many :reservations, through: :reservetables #are we sure about this?
  has_many :reservetables
  belongs_to :restaurant

  # method that is called automatically when an instance of
  # Table is called with .to_is the following method is applied
  # by Rafi
  
  def to_s
    "Table: #{self.id}, Capacity: #{self.capacity}"
  end
  
end
