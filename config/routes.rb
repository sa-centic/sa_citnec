Rails.application.routes.draw do
  devise_for :users

  resources :users

  root 'users#index'

  resources :courses do
    collection do
      get '/print/:id', to: 'courses#print', as: :print
    end
  end

  namespace :users do
    resources :coursetakers, class: 'Users::Coursetaker'
    resources :courseholders, class: 'Users::Courseholder'
    resources :admins, class: 'Users::Admin'
    resources :moderators, class: 'Users::Moderator'
  end
end