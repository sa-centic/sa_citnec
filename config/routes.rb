Rails.application.routes.draw do
  devise_for :users

  resources :users, :courses

  root 'users#index'

  namespace :users do
    resources :coursetakers, class: 'Users::Coursetaker'
    resources :courseholders, class: 'Users::Courseholder'
    resources :admins, class: 'Users::Admin'
    resources :moderators, class: 'Users::Moderator'
  end

  resources :documents do
    resources :fragments
  end

  get '/documents/:id/markdown', to: "documents#markdown", as: 'document_markdown'

end