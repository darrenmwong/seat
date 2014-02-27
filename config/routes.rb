Seat::Application.routes.draw do

  ActiveAdmin.routes(self)

  resources :servers
  resources :omniauth_callbacks
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users do
    resources :reservations
  end


  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/home/sign_in', to: 'home#sign_in', as: 'home_sign_in'
  root :to => "home#index"

end
#                      admin_root GET      /admin(.:format)                                admin/dashboard#index
#                 admin_dashboard GET      /admin/dashboard(.:format)                      admin/dashboard#index
# batch_action_admin_reservations POST     /admin/reservations/batch_action(.:format)      admin/reservations#batch_action
#              admin_reservations GET      /admin/reservations(.:format)                   admin/reservations#index
#                                 POST     /admin/reservations(.:format)                   admin/reservations#create
#           new_admin_reservation GET      /admin/reservations/new(.:format)               admin/reservations#new
#          edit_admin_reservation GET      /admin/reservations/:id/edit(.:format)          admin/reservations#edit
#               admin_reservation GET      /admin/reservations/:id(.:format)               admin/reservations#show
#                                 PATCH    /admin/reservations/:id(.:format)               admin/reservations#update
#                                 PUT      /admin/reservations/:id(.:format)               admin/reservations#update
#                                 DELETE   /admin/reservations/:id(.:format)               admin/reservations#destroy
#      batch_action_admin_servers POST     /admin/servers/batch_action(.:format)           admin/servers#batch_action
#                   admin_servers GET      /admin/servers(.:format)                        admin/servers#index
#                                 POST     /admin/servers(.:format)                        admin/servers#create
#                new_admin_server GET      /admin/servers/new(.:format)                    admin/servers#new
#               edit_admin_server GET      /admin/servers/:id/edit(.:format)               admin/servers#edit
#                    admin_server GET      /admin/servers/:id(.:format)                    admin/servers#show
#                                 PATCH    /admin/servers/:id(.:format)                    admin/servers#update
#                                 PUT      /admin/servers/:id(.:format)                    admin/servers#update
#                                 DELETE   /admin/servers/:id(.:format)                    admin/servers#destroy
#       batch_action_admin_tables POST     /admin/tables/batch_action(.:format)            admin/tables#batch_action
#                    admin_tables GET      /admin/tables(.:format)                         admin/tables#index
#                                 POST     /admin/tables(.:format)                         admin/tables#create
#                 new_admin_table GET      /admin/tables/new(.:format)                     admin/tables#new
#                edit_admin_table GET      /admin/tables/:id/edit(.:format)                admin/tables#edit
#                     admin_table GET      /admin/tables/:id(.:format)                     admin/tables#show
#                                 PATCH    /admin/tables/:id(.:format)                     admin/tables#update
#                                 PUT      /admin/tables/:id(.:format)                     admin/tables#update
#                                 DELETE   /admin/tables/:id(.:format)                     admin/tables#destroy
#                      admin_user POST     /admin/users/:id(.:format)                      admin/users#create
#                                 PUT      /admin/users/:id(.:format)                      admin/users#update
#        batch_action_admin_users POST     /admin/users/batch_action(.:format)             admin/users#batch_action
#                     admin_users GET      /admin/users(.:format)                          admin/users#index
#                                 POST     /admin/users(.:format)                          admin/users#create
#                  new_admin_user GET      /admin/users/new(.:format)                      admin/users#new
#                 edit_admin_user GET      /admin/users/:id/edit(.:format)                 admin/users#edit
#                                 GET      /admin/users/:id(.:format)                      admin/users#show
#                                 PATCH    /admin/users/:id(.:format)                      admin/users#update
#                                 PUT      /admin/users/:id(.:format)                      admin/users#update
#                                 DELETE   /admin/users/:id(.:format)                      admin/users#destroy
#                  admin_comments GET      /admin/comments(.:format)                       admin/comments#index
#                                 POST     /admin/comments(.:format)                       admin/comments#create
#                   admin_comment GET      /admin/comments/:id(.:format)                   admin/comments#show
#                         servers GET      /servers(.:format)                              servers#index
#                                 POST     /servers(.:format)                              servers#create
#                      new_server GET      /servers/new(.:format)                          servers#new
#                     edit_server GET      /servers/:id/edit(.:format)                     servers#edit
#                          server GET      /servers/:id(.:format)                          servers#show
#                                 PATCH    /servers/:id(.:format)                          servers#update
#                                 PUT      /servers/:id(.:format)                          servers#update
#                                 DELETE   /servers/:id(.:format)                          servers#destroy
#              omniauth_callbacks GET      /omniauth_callbacks(.:format)                   omniauth_callbacks#index
#                                 POST     /omniauth_callbacks(.:format)                   omniauth_callbacks#create
#           new_omniauth_callback GET      /omniauth_callbacks/new(.:format)               omniauth_callbacks#new
#          edit_omniauth_callback GET      /omniauth_callbacks/:id/edit(.:format)          omniauth_callbacks#edit
#               omniauth_callback GET      /omniauth_callbacks/:id(.:format)               omniauth_callbacks#show
#                                 PATCH    /omniauth_callbacks/:id(.:format)               omniauth_callbacks#update
#                                 PUT      /omniauth_callbacks/:id(.:format)               omniauth_callbacks#update
#                                 DELETE   /omniauth_callbacks/:id(.:format)               omniauth_callbacks#destroy
#                new_user_session GET      /users/sign_in(.:format)                        devise/sessions#new
#                    user_session POST     /users/sign_in(.:format)                        devise/sessions#create
#            destroy_user_session DELETE   /users/sign_out(.:format)                       devise/sessions#destroy
#         user_omniauth_authorize GET|POST /users/auth/:provider(.:format)                 omniauth_callbacks#passthru {:provider=>/facebook/}
#          user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)          omniauth_callbacks#(?-mix:facebook)
#                   user_password POST     /users/password(.:format)                       devise/passwords#create
#               new_user_password GET      /users/password/new(.:format)                   devise/passwords#new
#              edit_user_password GET      /users/password/edit(.:format)                  devise/passwords#edit
#                                 PATCH    /users/password(.:format)                       devise/passwords#update
#                                 PUT      /users/password(.:format)                       devise/passwords#update
#        cancel_user_registration GET      /users/cancel(.:format)                         devise_invitable/registrations#cancel
#               user_registration POST     /users(.:format)                                devise_invitable/registrations#create
#           new_user_registration GET      /users/sign_up(.:format)                        devise_invitable/registrations#new
#          edit_user_registration GET      /users/edit(.:format)                           devise_invitable/registrations#edit
#                                 PATCH    /users(.:format)                                devise_invitable/registrations#update
#                                 PUT      /users(.:format)                                devise_invitable/registrations#update
#                                 DELETE   /users(.:format)                                devise_invitable/registrations#destroy
#          accept_user_invitation GET      /users/invitation/accept(.:format)              devise/invitations#edit
#          remove_user_invitation GET      /users/invitation/remove(.:format)              devise/invitations#destroy
#                 user_invitation POST     /users/invitation(.:format)                     devise/invitations#create
#             new_user_invitation GET      /users/invitation/new(.:format)                 devise/invitations#new
#                                 PATCH    /users/invitation(.:format)                     devise/invitations#update
#                                 PUT      /users/invitation(.:format)                     devise/invitations#update
#               user_reservations GET      /users/:user_id/reservations(.:format)          reservations#index
#                                 POST     /users/:user_id/reservations(.:format)          reservations#create
#            new_user_reservation GET      /users/:user_id/reservations/new(.:format)      reservations#new
#           edit_user_reservation GET      /users/:user_id/reservations/:id/edit(.:format) reservations#edit
#                user_reservation GET      /users/:user_id/reservations/:id(.:format)      reservations#show
#                                 PATCH    /users/:user_id/reservations/:id(.:format)      reservations#update
#                                 PUT      /users/:user_id/reservations/:id(.:format)      reservations#update
#                                 DELETE   /users/:user_id/reservations/:id(.:format)      reservations#destroy
#                           users GET      /users(.:format)                                users#index
#                                 POST     /users(.:format)                                users#create
#                        new_user GET      /users/new(.:format)                            users#new
#                       edit_user GET      /users/:id/edit(.:format)                       users#edit
#                            user GET      /users/:id(.:format)                            users#show
#                                 PATCH    /users/:id(.:format)                            users#update
#                                 PUT      /users/:id(.:format)                            users#update
#                                 DELETE   /users/:id(.:format)                            users#destroy
#                         sign_in GET      /sign_in(.:format)                              devise/sessions#new
#                        sign_out GET      /sign_out(.:format)                             devise/sessions#destroy
#                                 GET      /auth/:provider/callback(.:format)              sessions#create
#                    auth_failure GET      /auth/failure(.:format)                         redirect(301, /)
#                         signout GET      /signout(.:format)                              sessions#destroy
#                    home_sign_in GET      /home/sign_in(.:format)                         home#sign_in
#                            root GET      /                                               home#index