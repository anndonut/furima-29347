Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "items#index"

  resources :items do
    resources :transactions 
  end
      #ネストで記述する

  resources :users, only: [:index, :new, :create]

  
 


end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #show.html
  #controller >> 
