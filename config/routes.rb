Rails.application.routes.draw do
  root to: 'maps#index'
  post 'maps', to: 'maps#create'
  resources :maps
end
