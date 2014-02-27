ActiveAdmin.register Reservation do

  form do |f|

    f.inputs "Label" do
      f.input :party_size
      f.input :begin
      f.input :table_ids
      f.input :server

      # etc
    end
    
    f.actions
  
  end

  filter :server
  filter :party_size
  filter :tables

  index do
    sting = ""
    column(:date) { |res| l(res.begin.to_date, format: :default) }
    column(:when) { |res| (res.begin.to_time + 8.hours).strftime("%l:%M %p") }
    column "Party Size", :party_size
    column(:server_id) { |res| Server.find(res.server_id).name }
    column(:tables) { |res| (res.tables.map { |t| t.to_s }) }
    #binding.pry
    default_actions 
  
  end

  controller do

    def permitted_params
      params.permit reservation: [ :begin, :end, :party_size, :server_id, :table_ids, :image_file_size ]
    end

    def update
      #
      permitted_params
      #
      res = Reservation.find(params[:id])
      #
      tables = params[:reservation][:table_ids]
      tables = tables.scan(/\w+/).map { |t| Table.find(t) }
      
      # tables.scan(/\w+/).each { |t| res.tables << Table.find(t) }
      res.tables = tables
      redirect_to admin_reservation_path(res.id)
    end


  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or  "Server", name  #{ |reservation| Server.find(reservation.server_id).name }
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
