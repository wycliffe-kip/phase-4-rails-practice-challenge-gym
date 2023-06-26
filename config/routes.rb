Rails.application.routes.draw do
  resources :memberships, only: [:create, :show, :delete]
  resources :clients, only: [:index, :show, :update]
  resources :gyms
end
