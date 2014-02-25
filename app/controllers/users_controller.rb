class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.nil?
      redirect_to sign_in_path
    elsif current_user.admin?
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    else
      redirect_to root_path
      flash[:error] = "Must be admin to access this page"
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end