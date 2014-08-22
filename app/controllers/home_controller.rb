class HomeController < ApplicationController
  # If you are stuck in the admin login path comment out the code below, and then 
  # sign in a non-admin role
   
  def index

  end


   def sign_in
    @user = current_user
     if @user.nil?
       redirect_to users_path
     elsif current_user.admin?
       redirect_to admin_reservations_path
     else
       redirect_to new_reservation_path
     end
    end
  end
