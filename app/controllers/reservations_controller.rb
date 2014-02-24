class ReservationsController < ApplicationController
  
  include ReservationsHelper

  def index
    @reservations = Reservation.all
    respond_to do |f|
      f.html
      f.json { render json: @reservations, only: [:date, :time_begin, :party_size] }
    end
  end

  def new
    @reservation = Reservation.new
    @times = []
    hours = [18, 19, 20, 21]
    hours.each do |x|
      @times << Time.new(Time.now.year, Time.now.month, Time.now.day, hour = x)
      @times << Time.new(Time.now.year, Time.now.month, Time.now.day, hour = x, min = 30)
    end
  end

  def create


    new_res = Reservation.create(permit_with_time_formatting)

    # Use method from ReservatoinsHelper to determine
    # the end of a reservation.  Set that value to new instance of Reservation
    time_end = end_time_calculator(new_res[:time_begin])
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

  private

    def permit_with_time_formatting    
      new_params = params.require(:reservation).permit(:date, :time_begin, :party_size)
      new_params[:time_begin] = new_params[:time_begin].to_time
      new_params
    end

end
