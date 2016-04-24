TodoApp::Application.routes.draw do
  root "users#new"
  resources :users
  resources :todo_lists
  resources :todo_items
  resource :session
end
