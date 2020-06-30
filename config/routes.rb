Rails.application.routes.draw do
  get '/', to: "application#login"
  get '/home', to: "user#home"

  resources :groups #, only: [:index, :show, :new, :create]
  
  # memberships shows all groups you are part of 
  resources :memberships, only: [:index, :create, :destroy]
  
  resources :activity_types, only: [:index, :create]

  # Goals and Goal Activities will have all RESTful routes 
  resources :activities 
  resources :goals
  resources :users, only: [:create, :new, :edit, :show, :update, :destroy]
end
