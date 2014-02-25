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
    @user = current_user
    if @user.nil?
      flash[:error] = "Must be signed in to make reservation"
      redirect_to sign_in_path
  else
    @reservation = Reservation.new
  end
  end

  def create
    @user = current_user
    new_party = params.require(:reservation).permit(:party_size)
  
    # Extract date entries from params
    new_date = params.require(:reservation).permit(:date)

    # Create new DateTime object with each piece of date hash in params hash
    new_date[:begin] = DateTime.new(new_date["date(1i)"].to_i, new_date["date(2i)"].to_i, new_date["date(3i)"].to_i, new_date["date(4i)"].to_i, new_date["date(5i)"].to_i)
    new_params = { party_size: new_party[:party_size], begin: new_date[:begin] }
    new_res = @user.reservations.create(new_params)

    # Use method from ReservatoinsHelper to determine
    # the end of a reservation.  Set that value to new instance of Reservation
    time_end = end_time_calculator(new_res[:begin])
    new_res.update_attributes(end: time_end)
    
    respond_to do |f|
      f.html { redirect_to user_reservation_path(current_user.id, new_res.id) }
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
    # Do we need to add a specific method/mean for table to be associated?
    # Performing a .each on the collection of tables and adding something like
    # reservation.tables << Table.find(id) where id is extracted from :tables

    reservation = Reservation.find(params[:id])
    if current_user.admin?
      updated_info = params.require(:reservation).permit(:party_size, :begin, :end, :server_id, :tables, :restaurant_id)
      reservation.update_attributes(updated_info)
      redirect_to admin_reservation_path(reservation.id)
    else
      updated_info = params.require(:reservation).permit(:party_size, :begin)
      reservation.update_attributes(updated_info)
      redirect_to users_reservation_path(reservation.id)
    end
  end

  def delete
    reservation = Reservation.find(params[:id])
    reservation.destroy
    if current_user.admin?
      redirect_to admin_reservations_path
    else
      redirect_to users_reservations_path
    end
  end

end
