ActiveAdmin.register Table do
  config.sort_order = "id_asc"
  
  index do
    column "Table Number", :id, sortable: true
    column "Capacity", :capacity
    # column "Server", :server_id #do |id| Server.find(id).name end
    # filter :server_id, as: :check_boxes, collection: proc { Server.all }
    default_actions
   
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

  controller do

    def permitted_params
      params.permit table: [ :capacity ]
    end

    def update
      permitted_params

      # Find table and params value in question
      table = Table.find(params[:id])
      new_capa = params[:table][:capacity]
      # Convert to integer
      new_capa = new_capa.to_i
      # Reassign value and save
      table.capacity = new_capa
      table.save
    end
    
  end

  
end
