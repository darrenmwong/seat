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
      @times << DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, hour = x)
      @times << DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, hour = x, min = 30)
    end
  end

  def create
    new_params = params.require(:reservation).permit(:begin, :party_size)
    
    # Extract faux date entries from Params
    new_date = params.require(:reservation).permit(:date)
    
    # Create new DateTime object with Date from Params as date and Time from user input (Radio Buttons)
    new_params[:begin] = DateTime.new(new_date["date(1i)"].to_i, new_date["date(2i)"].to_i, new_date["date(3i)"].to_i, new_params[:begin].to_datetime.hour, new_params[:begin].to_datetime.min)
    new_res = Reservation.create(new_params)
    
    # Use method from ReservatoinsHelper to determine
    # the end of a reservation.  Set that value to new instance of Reservation
    time_end = end_time_calculator(new_res[:begin])
    new_res.update_attributes(end: time_end)
    
    respond_to do |f|
      f.html { redirect_to reservation_path(new_res.id) }
      # f.json { render json: @new_res, only: [:date, :time_begin, :party_size] }
    end

  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    # def permit_with_time_formatting    
      
    #   new_params[:time_begin] = new_params[:time_begin].to_time
    #   new_params
    #   binding.pry
    # end

end
