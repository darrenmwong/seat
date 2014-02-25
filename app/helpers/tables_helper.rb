module TablesHelper

  def user_is_admin
    current_user.admin?
  end
  
end
