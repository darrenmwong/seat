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
  end

  def create
    new_party = params.require(:reservation).permit(:party_size)
    
    # Extract date entries from params
    new_date = params.require(:reservation).permit(:date)

    # Create new DateTime object with each piece of date hash in params hash
    new_date[:begin] = DateTime.new(new_date["date(1i)"].to_i, new_date["date(2i)"].to_i, new_date["date(3i)"].to_i, new_date["date(4i)"].to_i, new_date["date(5i)"].to_i)
    new_params = { party_size: new_party[:party_size], begin: new_date[:begin] }
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
    @reservation = Reservation.find(params[:id])
  end

  def update
    reservation = Reservation.find(params[:id])
    if current_user.admin?
      updated_info = params.require(:reservation).permit(:party_size, :begin, :end, :server_id, :tables, :restaurant_id)
      reservation.update_attributes(updated_info)
      redirect_to admin_reservation_path(reservation.id)
    else
      updated_info = params.require(:reservation).permit(:party_size, :begin)
      reservation.update_attributes(updated_info)
      redirect_to reservation_path(reservation.id)
    end
  end

  def delete
    reservation = Reservation.find(params[:id])
    reservation.destroy
    if current_user.admin?
      redirect_to admin_reservations_path
    else
      redirect_to reservations_path
    end
  end

end
