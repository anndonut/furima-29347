Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "items#index"
  # devise_scope :user do
  #   get 'addresses', to:'users/registrations#new_address'
  #   post 'addresses', to: 'users/registrations#create_address'
  # end

  # resources :users, only: [:index, :new, :create]
  resources :items 
  
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

