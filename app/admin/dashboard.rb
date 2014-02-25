ActiveAdmin.register_page "Dashboard" do
  # "Recent Reservations" do
  #   table_for Reservation.create("reserved_at desc").limit(5) do
  #     column :name do |reservation|
  #       link_to reservation.user.name, admin_product_path(product)
  #     end
  #     column :time_begin
  #   end
  #   strong { link_to "View All Reservations", admin_products_path }
  # end


  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
