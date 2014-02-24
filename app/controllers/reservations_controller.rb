class ReservationsController < ApplicationController
  
  include ReservationsHelper
  require 'time'

  def index
    @reservations = Reservation.all
    respond_to do |f|
      f.html
      f.json { render json: @reservations, only: [:date, :time_begin, :party_size] }
    end
  end

  def new
    @reservation = Reservation.new
    @time = ["16:00:00", "18:30:00", "19:00:00", "19:30:00", "20:00:00", "20:30:00"]
    @time.each do |time|
    Time.parse(time)
    binding.pry
  end
  end

  def create
    new_res_params = params.require(:reservation).permit(:date, :time_begin, :party_size)
    new_res = Reservation.create(new_res_params)

    # Use method from ReservatoinsHelper to determine
    # the end of a reservation.  Set that value to new instance of Reservation
    time_end = end_time_calculator(:time_begin)
    new_res.update_attributes(time_end: time_end)
    @new_reservation = Reservation.last
    respond_to do |f|
      f.html
      f.json { render json: @new_reservation, only: [:date, :time_begin, :party_size] }
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

end
