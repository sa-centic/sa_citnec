Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #
  match '/users',   to: 'users#index',   via: 'get'

  # Defines the root path route ("/")
   root "users#index"
end
