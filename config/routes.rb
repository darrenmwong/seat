Seat::Application.routes.draw do
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


# RAKE ROUTES
#      Prefix Verb   URI Pattern                        Controller#Action
#             reservations GET    /reservations(.:format)            reservations#index
#                          POST   /reservations(.:format)            reservations#create
#          new_reservation GET    /reservations/new(.:format)        reservations#new
#         edit_reservation GET    /reservations/:id/edit(.:format)   reservations#edit
#              reservation GET    /reservations/:id(.:format)        reservations#show
#                          PATCH  /reservations/:id(.:format)        reservations#update
#                          PUT    /reservations/:id(.:format)        reservations#update
#                          DELETE /reservations/:id(.:format)        reservations#destroy
#            servers_index GET    /servers/index(.:format)           servers#index
#              servers_new GET    /servers/new(.:format)             servers#new
#           servers_create GET    /servers/create(.:format)          servers#create
#                     root GET    /                                  home#index
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#            user_password POST   /users/password(.:format)          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#                          PATCH  /users/password(.:format)          devise/passwords#update
#                          PUT    /users/password(.:format)          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)            registrations#cancel
#        user_registration POST   /users(.:format)                   registrations#create
#    new_user_registration GET    /users/sign_up(.:format)           registrations#new
#   edit_user_registration GET    /users/edit(.:format)              registrations#edit
#                          PATCH  /users(.:format)                   registrations#update
#                          PUT    /users(.:format)                   registrations#update
#                          DELETE /users(.:format)                   registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)      devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)  devise/confirmations#new
#                          GET    /users/confirmation(.:format)      devise/confirmations#show
#   accept_user_invitation GET    /users/invitation/accept(.:format) devise/invitations#edit
#   remove_user_invitation GET    /users/invitation/remove(.:format) devise/invitations#destroy
#          user_invitation POST   /users/invitation(.:format)        devise/invitations#create
#      new_user_invitation GET    /users/invitation/new(.:format)    devise/invitations#new
#                          PATCH  /users/invitation(.:format)        devise/invitations#update
#                          PUT    /users/invitation(.:format)        devise/invitations#update
#                    users GET    /users(.:format)                   users#index
#                          POST   /users(.:format)                   users#create
#                 new_user GET    /users/new(.:format)               users#new
#                edit_user GET    /users/:id/edit(.:format)          users#edit
#                     user GET    /users/:id(.:format)               users#show
#                          PATCH  /users/:id(.:format)               users#update
#                          PUT    /users/:id(.:format)               users#update
#                          DELETE /users/:id(.:format)               users#destroy