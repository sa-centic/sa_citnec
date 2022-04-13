Rails.application.routes.draw do
  devise_for :users

  resources :users, :courses

  root 'users#index'

  resources :courses do
    resources :prints, scope: :courses, module: :courses
  end

  namespace :users do
    resources :coursetakers, class: 'Users::Coursetaker'
    resources :courseholders, class: 'Users::Courseholder'
    resources :admins, class: 'Users::Admin'
    resources :moderators, class: 'Users::Moderator'
  end
end