Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :courses do
    resources :posts
  end

  root 'users#index'

  namespace :users do
    resources :coursetakers, class: 'Users::Coursetaker'
    resources :courseholders, class: 'Users::Courseholder'
    resources :admins, class: 'Users::Admin'
    resources :moderators, class: 'Users::Moderator'
  end
end