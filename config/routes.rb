Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #
  scope :users, module: :users do
    resources :coursetakers, class: 'Users::Coursetaker'
    resources :courseholders, class: 'Users::Courseholder'
  end

  # Defines the root path route ("/")
   root "users#index"
end
