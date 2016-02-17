Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tasks do
  	resources :comments, only: [:create, :destroy]
  end

  devise_for :users
  resources :projects do
    resources :notes
  end

  get 'pages/index'

  root 'pages#index'


 
end
