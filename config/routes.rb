Rails.application.routes.draw do
  
  root "sessions#new"
  get '/home/:id', to: "users#home"
  delete "/logout", to: "sessions#destroy"
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#welcome'

  resources :groups #, only: [:index, :show, :new, :create]
  
  # memberships shows all groups you are part of 
  resources :memberships, only: [:index, :create, :destroy]
  
  resources :activity_types, only: [:index]



  # Goals and Goal Activities will have all RESTful routes 
  resources :activities 
  resources :goals
  resources :users, only: [:create, :new, :edit, :show, :update, :destroy]
end
