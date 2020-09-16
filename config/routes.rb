Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # resources: users, only:[:new, :create]
  
  
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

