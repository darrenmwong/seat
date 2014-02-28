ActiveAdmin.register Table do
  config.sort_order = "section_id_asc"
  
  filter :section_id, :as => :check_boxes, :collection => proc { (1..5).to_a }
  filter :capacity

  index do
    column "Section", :section_id
    column "Table Number", :id
    column "Capacity", :capacity
    default_actions
  end

  show do |table|
    attributes_table do
      row :restaurant
      row :capacity
    end
  end

  controller do

    def permitted_params
      params.permit table: [ :capacity ]
    end

    def create
      permitted_params

      t = Table.new
      t.capacity = params[:table][:capacity]
      t.save
      redirect_to admin_table_path(t.id)
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
