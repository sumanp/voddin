Rails.application.routes.draw do
  resources :projects do
    resources :notes
  end

  get 'pages/index'

  root 'pages#index'


 
end
