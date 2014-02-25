ActiveAdmin.register Table do

  
  index do
    column "Table Number", :id
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
      params.permit table: [ :capacity, :restaurant_id ]
    end
  end

  
end
