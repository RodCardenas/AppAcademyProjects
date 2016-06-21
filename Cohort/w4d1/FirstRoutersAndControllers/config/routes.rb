Rails.application.routes.draw do

  resources :users, only: [:show, :create, :destroy, :index, :update] do
    resources :contacts, only: [:show, :create, :destroy, :index, :update]
    # get 'favorite_contact', :on => :favorite
  end

  resources :contact_shares, only: [:create, :destroy]
end
