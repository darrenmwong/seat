ActiveAdmin.register Table do
  config.sort_order = "id_asc"
  
  # filter :section
  filter :capacity

  index do
    column :label => "Section" do |table|
      if table.id % 3 == 1
        "Section #{table.id % 3}"
      elsif table.id % 3 == 2
        "Section #{table.id % 3}"
      else
        "Section #{(table.id % 3) + 3}"
      end
    end
    column "Table Number", :id
    column "Capacity", :capacity
    default_actions
  end

  show do |table|
    attributes_table do
      row "Restaurant", :restaurant
      row "Seats", :capacity
    end
  end

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
      redirect_to admin_table_path(table.id)
    end

  end

  
end
