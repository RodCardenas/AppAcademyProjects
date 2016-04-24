Links::Application.routes.draw do
  root "users#new"

  resource :session

  resources :comments

  resources :links

  resources :users

end
