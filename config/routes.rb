Rails.application.routes.draw do
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
