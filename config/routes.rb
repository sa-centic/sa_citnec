Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users
  resources :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #
  match '/users',   to: 'users#index',   via: 'get'
  match '/courses', to: 'courses#index', via: 'get'

  # Defines the root path route ("/")
   root "users#index"
end
