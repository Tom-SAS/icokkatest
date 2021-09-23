Rails.application.routes.draw do
  devise_for :users
  root to: 'maps#index'
  post 'maps', to: 'maps#create'
  resources :maps
end
