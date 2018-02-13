Rails.application.routes.draw do
  root 'welcome#home'

  #login form
	get '/login' => 'sessions#new'
	#logging in
	post '/login' => 'sessions#create'
	#logging out
	get '/logout' => 'sessions#destroy'
  
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
