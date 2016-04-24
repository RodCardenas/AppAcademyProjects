Rails.application.routes.draw do
  root "users#new"
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:show, :new, :create, :destroy]
end
