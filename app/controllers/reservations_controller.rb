class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    new_res = params.require(:reservation).permit(:date, :time_begin, :party_size)
    Reservation.create(new_res)
    time_end = new_res[:time_begin]
  end

  def edit
  end

  def update
  end

  def delete
  end

end
