Rails.application.routes.draw do
  devise_for :users

  resources :users

  root 'users#index'

  resources :courses do
    resources :pdfs, only: [:index, :create, :new], module: :courses
    collection do
      get '/print/:id', to: 'courses#print', as: :print
    end
  end

  namespace :courses do
    resources :multiple_pdfs
  end

  namespace :users do
    resources :coursetakers, class: 'Users::Coursetaker'
    resources :courseholders, class: 'Users::Courseholder'
    resources :admins, class: 'Users::Admin'
    resources :moderators, class: 'Users::Moderator'
  end
end