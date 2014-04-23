class ReservationsController < ApplicationController
  
  include ReservationsHelper

  def index
    @reservations = current_user.reservations.all
    respond_to do |f|
      f.html
      f.json { render json: @reservations, only: [:begin, :party_size] }
    end
  end

  def new
    if current_user.nil?
      flash[:error] = "Must be signed in to make reservation"
      redirect_to sign_in_path
    else
      @reservation = current_user.reservations.new

    end
  end

  def create
    new_party = params.require(:reservation).permit(:party_size)
  
    # Extract date entries from params
    new_date = params.require(:reservation).permit(:begin)
    
    # Create new DateTime object with each piece of date hash in params hash
    # 1i is the year, 2i is the month, 3i is the day
    new_date[:begin] = DateTime.new(new_date["begin(1i)"].to_i, new_date["begin(2i)"].to_i, new_date["begin(3i)"].to_i, new_date["begin(4i)"].to_i, new_date["begin(5i)"].to_i)
    # new_date[:begin] = DateTime.new(new_date["begin(1i)"].to_i, new_date["begin(2i)"].to_i, new_date["begin(3i)"].to_i)
    
    new_params = { party_size: new_party[:party_size], begin: new_date[:begin] }
    
    new_res = current_user.reservations.create(new_params)

    # Use method from ReservatoinsHelper to determine
    # the end of a reservation.  Set that value to new instance of Reservation
    time_end = end_time_calculator(new_res[:begin])

    new_res.end = time_end
    new_res.save
    # Confirm reseration with email
    ReservationMailer.reservation_confirmation(current_user.id, new_res.id).deliver

    respond_to do |f|
      f.html { redirect_to user_path(current_user.id) }
    end

  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  def update
    # this method only applies if current_user.superadmin = false

    # First find the reservation through the current_user.reservation
    reservation = current_user.reservations.find(params[:id])
    # extract the string
    new_party_size = params.require(:reservation).permit(:party_size)
    # Extract from hash
    newparty = new_party_size["party_size"]
    # Convert to integer
    newparty = newparty.to_i
    # set reservation.party_size to the new_party_size
    reservation.party_size = newparty

    # Second grab the dates to change (from create [above] and admin/reservations.rb [line 67])
    res_begin = params.require(:reservation).permit(:begin)
    # create new DateTime object
    new_begin = DateTime.new(res_begin["begin(1i)"].to_i, res_begin["begin(2i)"].to_i, res_begin["begin(3i)"].to_i, res_begin["begin(4i)"].to_i, res_begin["begin(5i)"].to_i)
    # set reservation.begin to new_begin
    reservation.begin = new_begin

    # Save changes and commit to database
    reservation.save

    # Update user with email
    ReservationMailer.reservation_update_confirmation(current_user.id, reservation.id).deliver
    redirect_to user_path(current_user.id)
  end

  def destroy
    reservation = current_user.reservations.find(params[:id])
    reservation.destroy
    redirect_to user_path(current_user.id)
  end
  

end
