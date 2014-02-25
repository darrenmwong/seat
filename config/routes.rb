Seat::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :reservations
  resources :servers
  resources :omniauth_callbacks
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root :to => "home#index"
end

# Do we need table routes?

#                          Prefix Verb       URI Pattern                                Controller#Action
#          new_admin_user_session GET        /admin/login(.:format)                     active_admin/devise/sessions#new
#              admin_user_session POST       /admin/login(.:format)                     active_admin/devise/sessions#create
#      destroy_admin_user_session DELETE|GET /admin/logout(.:format)                    active_admin/devise/sessions#destroy
#             admin_user_password POST       /admin/password(.:format)                  active_admin/devise/passwords#create
#         new_admin_user_password GET        /admin/password/new(.:format)              active_admin/devise/passwords#new
#        edit_admin_user_password GET        /admin/password/edit(.:format)             active_admin/devise/passwords#edit
#                                 PATCH      /admin/password(.:format)                  active_admin/devise/passwords#update
#                                 PUT        /admin/password(.:format)                  active_admin/devise/passwords#update
#                      admin_root GET        /admin(.:format)                           admin/dashboard#index
#  batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)  admin/admin_users#batch_action
#               admin_admin_users GET        /admin/admin_users(.:format)               admin/admin_users#index
#                                 POST       /admin/admin_users(.:format)               admin/admin_users#create
#            new_admin_admin_user GET        /admin/admin_users/new(.:format)           admin/admin_users#new
#           edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)      admin/admin_users#edit
#                admin_admin_user GET        /admin/admin_users/:id(.:format)           admin/admin_users#show
#                                 PATCH      /admin/admin_users/:id(.:format)           admin/admin_users#update
#                                 PUT        /admin/admin_users/:id(.:format)           admin/admin_users#update
#                                 DELETE     /admin/admin_users/:id(.:format)           admin/admin_users#destroy
#                 admin_dashboard GET        /admin/dashboard(.:format)                 admin/dashboard#index
# batch_action_admin_reservations POST       /admin/reservations/batch_action(.:format) admin/reservations#batch_action
#              admin_reservations GET        /admin/reservations(.:format)              admin/reservations#index
#                                 POST       /admin/reservations(.:format)              admin/reservations#create
#           new_admin_reservation GET        /admin/reservations/new(.:format)          admin/reservations#new
#          edit_admin_reservation GET        /admin/reservations/:id/edit(.:format)     admin/reservations#edit
#               admin_reservation GET        /admin/reservations/:id(.:format)          admin/reservations#show
#                                 PATCH      /admin/reservations/:id(.:format)          admin/reservations#update
#                                 PUT        /admin/reservations/:id(.:format)          admin/reservations#update
#                                 DELETE     /admin/reservations/:id(.:format)          admin/reservations#destroy
#                  admin_comments GET        /admin/comments(.:format)                  admin/comments#index
#                                 POST       /admin/comments(.:format)                  admin/comments#create
#                   admin_comment GET        /admin/comments/:id(.:format)              admin/comments#show
#                    reservations GET        /reservations(.:format)                    reservations#index
#                                 POST       /reservations(.:format)                    reservations#create
#                 new_reservation GET        /reservations/new(.:format)                reservations#new
#                edit_reservation GET        /reservations/:id/edit(.:format)           reservations#edit
#                     reservation GET        /reservations/:id(.:format)                reservations#show
#                                 PATCH      /reservations/:id(.:format)                reservations#update
#                                 PUT        /reservations/:id(.:format)                reservations#update
#                                 DELETE     /reservations/:id(.:format)                reservations#destroy
#                         servers GET        /servers(.:format)                         servers#index
#                                 POST       /servers(.:format)                         servers#create
#                      new_server GET        /servers/new(.:format)                     servers#new
#                     edit_server GET        /servers/:id/edit(.:format)                servers#edit
#                          server GET        /servers/:id(.:format)                     servers#show
#                                 PATCH      /servers/:id(.:format)                     servers#update
#                                 PUT        /servers/:id(.:format)                     servers#update
#                                 DELETE     /servers/:id(.:format)                     servers#destroy
#              omniauth_callbacks GET        /omniauth_callbacks(.:format)              omniauth_callbacks#index
#                                 POST       /omniauth_callbacks(.:format)              omniauth_callbacks#create
#           new_omniauth_callback GET        /omniauth_callbacks/new(.:format)          omniauth_callbacks#new
#          edit_omniauth_callback GET        /omniauth_callbacks/:id/edit(.:format)     omniauth_callbacks#edit
#               omniauth_callback GET        /omniauth_callbacks/:id(.:format)          omniauth_callbacks#show
#                                 PATCH      /omniauth_callbacks/:id(.:format)          omniauth_callbacks#update
#                                 PUT        /omniauth_callbacks/:id(.:format)          omniauth_callbacks#update
#                                 DELETE     /omniauth_callbacks/:id(.:format)          omniauth_callbacks#destroy
#                new_user_session GET        /users/sign_in(.:format)                   devise/sessions#new
#                    user_session POST       /users/sign_in(.:format)                   devise/sessions#create
#            destroy_user_session DELETE     /users/sign_out(.:format)                  devise/sessions#destroy
#         user_omniauth_authorize GET|POST   /users/auth/:provider(.:format)            omniauth_callbacks#passthru {:provider=>/facebook/}
#          user_omniauth_callback GET|POST   /users/auth/:action/callback(.:format)     omniauth_callbacks#(?-mix:facebook)
#                   user_password POST       /users/password(.:format)                  devise/passwords#create
#               new_user_password GET        /users/password/new(.:format)              devise/passwords#new
#              edit_user_password GET        /users/password/edit(.:format)             devise/passwords#edit
#                                 PATCH      /users/password(.:format)                  devise/passwords#update
#                                 PUT        /users/password(.:format)                  devise/passwords#update
#        cancel_user_registration GET        /users/cancel(.:format)                    devise_invitable/registrations#cancel
#               user_registration POST       /users(.:format)                           devise_invitable/registrations#create
#           new_user_registration GET        /users/sign_up(.:format)                   devise_invitable/registrations#new
#          edit_user_registration GET        /users/edit(.:format)                      devise_invitable/registrations#edit
#                                 PATCH      /users(.:format)                           devise_invitable/registrations#update
#                                 PUT        /users(.:format)                           devise_invitable/registrations#update
#                                 DELETE     /users(.:format)                           devise_invitable/registrations#destroy
#          accept_user_invitation GET        /users/invitation/accept(.:format)         devise/invitations#edit
#          remove_user_invitation GET        /users/invitation/remove(.:format)         devise/invitations#destroy
#                 user_invitation POST       /users/invitation(.:format)                devise/invitations#create
#             new_user_invitation GET        /users/invitation/new(.:format)            devise/invitations#new
#                                 PATCH      /users/invitation(.:format)                devise/invitations#update
#                                 PUT        /users/invitation(.:format)                devise/invitations#update
#                           users GET        /users(.:format)                           users#index
#                                 POST       /users(.:format)                           users#create
#                        new_user GET        /users/new(.:format)                       users#new
#                       edit_user GET        /users/:id/edit(.:format)                  users#edit
#                            user GET        /users/:id(.:format)                       users#show
#                                 PATCH      /users/:id(.:format)                       users#update
#                                 PUT        /users/:id(.:format)                       users#update
#                                 DELETE     /users/:id(.:format)                       users#destroy
#                         sign_in GET        /sign_in(.:format)                         devise/sessions#new
#                        sign_out GET        /sign_out(.:format)                        devise/sessions#destroy
#                                 GET        /auth/:provider/callback(.:format)         sessions#create
#                    auth_failure GET        /auth/failure(.:format)                    redirect(301, /)
#                         signout GET        /signout(.:format)                         sessions#destroy
#                            root GET        /                                          home#index