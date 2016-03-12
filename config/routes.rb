Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tasks do
  	resources :comments, only: [:create, :destroy]
    member do
      patch :toggle
    end
  end

  
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :projects do
    resources :notes
  end

  get 'pages/index'
  get 'pages/disclaimer'

  root 'pages#index'


 
end
