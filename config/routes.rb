Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :notes
  end

  get 'pages/index'

  root 'pages#index'


 
end
