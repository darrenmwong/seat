ActiveAdmin.register Server do
  config.sort_order = "id_asc"
  
  form do |f|
    f.inputs "Server" do
      f.input :name
    end

    f.actions
  end

  filter :name
  filter :created_at, :label => "Hired Date"

  index do
    column(:name) { |serv| serv.name if serv.id != 11 }
    column(:hired_date) { |serv| serv.created_at.to_date.strftime("%A %b. %d, %Y") if serv.id != 11 }
    default_actions
  end

  show do |server|
    attributes_table do
      row :restaurant
      row(:name) { |serv| serv.name if serv.id != 11 }
      row(:hired_date) { |serv| serv.created_at.to_date.strftime("%A %b. %d, %Y") }
      row(:employee_id) { |serv| serv.id if serv.id != 11}
    end
  end

  controller do

    def permitted_params
      params.permit server: [ :name ]
    end

    def update
      permitted_params
      # Find server in question and new name input
      server = Server.find(params[:id])
      new_name = params[:server][:name]
      # Apply new name and save
      server.name = new_name
      server.save
    end

  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
