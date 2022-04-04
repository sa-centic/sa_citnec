Rails.application.routes.draw do
  devise_for :users

  resources :users, :courses

  root 'users#index'

  namespace :users do
    resources :coursetakers, class: 'Users::Coursetaker'
    resources :courseholders, class: 'Users::Courseholder'
  end
end