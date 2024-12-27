Rails.application.routes.draw do
  
 
  root 'home#index'
  get 'home/users'
  get 'home/admin'

  #Define other routes for resources
  resources :utilities
  resources :products
  resources :kiosks

  # # Admin dashboard route
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  end
  namespace :users do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  end

  # Devise routes for users
  devise_for :users, controllers: { 
    sessions: 'users/sessions' }

  devise_for :admin, controllers: { 
    sessions: 'admin/sessions' }

end

