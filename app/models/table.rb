class Table < ActiveRecord::Base
  has_many :reservations, through: :reservetables #are we sure about this?
  has_many :reservetables
  belongs_to :restaurant

  # method that is called automatically when an instance of
  # Table is called 
  def to_s
    "table: #{self.id}"
  end
end
