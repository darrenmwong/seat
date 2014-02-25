class ReservationsController < ApplicationController
  
  include ReservationsHelper

  # def admin_redirect
  #   if current_user.admin?
  #     redirect to admin_reservations_path
  #   else
  #     redirect to new_reservation_path
  #   end
  # end

  def index
    @reservations = Reservation.all
    respond_to do |f|
      f.html
      f.json { render json: @reservations, only: [:date, :time_begin, :party_size] }
    end
  end

  def new
    @user = current_user
    @reservation = Reservation.new
    @times = []
    hours = [18, 19, 20, 21]
    hours.each do |x|
      @times << l(Time.new(Time.now.year, Time.now.month, Time.now.day, hour = x), format: :default)
      @times << l(Time.new(Time.now.year, Time.now.month, Time.now.day, hour = x, min = 30), format: :default)
    end
  end

  def create
    new_res_params = params.require(:reservation).permit(:date, :time_begin, :party_size)
    new_res_params[:time_begin] = l(:time_begin, format: :default)
    new_res = Reservation.create(new_res_params)

    # Use method from ReservatoinsHelper to determine
    # the end of a reservation.  Set that value to new instance of Reservation
    time_end = end_time_calculator(new_res[:time_begin])
    new_res.update_attributes(time_end: l(time_end, format: :default))
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
