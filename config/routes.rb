Rails.application.routes.draw do
  get 'maps/index'
  resources :maps
end
