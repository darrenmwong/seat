ActiveAdmin.register User do
  config.sort_order = "id_asc"

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :superadmin, :label => "Super Administrator"
    end
    f.buttons
  end

  filter :name
  filter :superadmin, :as => :check_boxes
  filter :email

  index do
    column :id
    column :name
    column :email
    column :last_sign_in_at
    column :superadmin
    
  end

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])
    @user.superadmin = params[:user][:superadmin]
    @user.attributes = params[:user].delete_if do |k, v|
      (k == "superadmin") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end
