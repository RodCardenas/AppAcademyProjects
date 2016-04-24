Links::Application.routes.draw do
  resources :users
  resources :links do
    resources :comments
  end
  resource :session

end
