Rails.application.routes.draw do
  resources :stations, only: [:index, :create, :update, :destroy, :show]
end
