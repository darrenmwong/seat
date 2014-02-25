ActiveAdmin.register Reservation do

   index do
    column :begin
    column :party_size
    default_actions
   
  end

  controller do
    def permitted_params
      params.permit reservation: [ :begin, :end, :party_size, :image_file_size, :created_at, :updated_at ]
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
