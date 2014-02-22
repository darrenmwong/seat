Seat::Application.routes.draw do
  get "reservations/index"
  get "reservations/new"
  get "reservations/create"
  get "reservations/edit"
  get "reservations/update"
  get "reservations/delete"
  get "servers/index"
  get "servers/new"
  get "servers/create"
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end