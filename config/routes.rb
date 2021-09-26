Rails.application.routes.draw do
  devise_for :users
  root to: 'maps#index'
  get 'maps/index'
  post 'maps', to: 'maps#create'
  resources :maps, only:[:new, :create, :index, :show, :edit, :destroy] do
    resources :comments, only:[:new, :create, :index, :show]
  end
  
end
