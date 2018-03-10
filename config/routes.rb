Rails.application.routes.draw do
  resources :stations, only: [:index, :create, :update, :destroy, :show]
  resources :bikes, only: [:index, :create, :update, :destroy, :show]
  resources :users, only: [:index, :create, :update, :destroy, :show]
end
