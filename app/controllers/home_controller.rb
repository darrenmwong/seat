class HomeController < ApplicationController
   
   def index
    @user = current_user
     if @user.nil?
       redirect_to new_user_session_path
     elsif current_user.admin?
       redirect_to reservations_path
     else
       redirect_to new_reservation_path
     end
    end
end