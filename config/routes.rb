Rails.application.routes.draw do
  root 'welcome#home'

  #login form
  get '/login', to 'sessions#new'
  #logging in
  post '/login', to 'sessions#create'
  #logging out
  get '/logout', to 'sessions#destroy'
  
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
