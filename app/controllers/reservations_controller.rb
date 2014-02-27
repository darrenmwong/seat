class ReservationsController < ApplicationController
  
  include ReservationsHelper

  def index
    @reservations = Reservation.all
    respond_to do |f|
      f.html
      f.json { render json: @reservations, only: [:begin, :party_size] }
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
    new_date = params.require(:reservation).permit(:begin)
    
    # Create new DateTime object with each piece of date hash in params hash
    new_date[:begin] = DateTime.new(new_date["begin(1i)"].to_i, new_date["begin(2i)"].to_i, new_date["begin(3i)"].to_i, new_date["begin(4i)"].to_i, new_date["begin(5i)"].to_i)
    
    new_params = { party_size: new_party[:party_size], begin: new_date[:begin] }
    
    new_res = @user.reservations.create(new_params)

    # Use method from ReservatoinsHelper to determine
    # the end of a reservation.  Set that value to new instance of Reservation
    time_end = end_time_calculator(new_res[:begin])
    new_res.update_attributes(end: time_end)
    reservation_confirmation_email_send(@user)

    respond_to do |f|
      f.html { redirect_to user_reservation_path(@user.id, new_res.id) }
    end

  end

  def show
    @user = current_user
    @reservation = @user.reservations.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    if current_user.superadmin?
      reservation = Reservation.find(params[:id])
      updated_info = params.require(:reservation).permit(:party_size, :begin, :end, :server_id, :table_ids, :restaurant_id)
      updated_info[:table_ids].each { |tid| reservation.tables << tid if tid != "" }
      reservation.update_attributes(updated_info)
      binding.pry
      redirect_to admin_reservation_path(reservation.id)
    else
      @reservation = current_user.reservations.find(params[:id])
      updated_info = params.require(:reservation).permit(:party_size, :begin)
      @reservation.update_attributes(updated_info)
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    user = User.find(params[:user_id])
    reservation = user.reservations.find(params[:id])
    reservation.destroy
    redirect_to user_path(current_user.id)
  end
  

end
