Links::Application.routes.draw do
  root "users#new"
  resources :users, except: [:destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :links do
    resources :comments
  end
end
