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
    column(:name) { |serv| serv.name }
    column(:hired_date) { |serv| serv.created_at.to_date.strftime("%A %b. %d, %Y") if serv.id != 11 }
    default_actions
  end

  show do |server|
    attributes_table do
      row :restaurant
      row(:name) { |serv| serv.name }
      row(:hired_date) { |serv| serv.created_at.to_date.strftime("%A %b. %d, %Y") }
      row(:employee_id) { |serv| serv.id }
      row(:reservations_scheduled) do |server|
        server.reservations.map do |res|
          ["Reservation ID: #{res.id}", "Reservation Name: #{User.find(res.user_id).name}", "Date: #{res.begin.to_date.strftime("%A %b. %d, %Y")}", "Time: #{(res.begin.to_time + 8.hours).strftime("%l:%M %p")}",
          "Number Of Guests: #{res.party_size}"]
        end
      end
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
  
end
