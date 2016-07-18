Rails.application.routes.draw do
  
  

  

  get '/login', to: 'sessions#new',as: 'login'
  post '/login', to: 'sessions#create', as: 'login_create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help',as: 'help'
  get '/home', to: 'static_pages#home',as: 'home'
  get '/about', to: 'static_pages#about',as: 'about'
  get '/signup', to:'users#new',as:'signup'
  get '/contacts',to: 'static_pages#contacts',as: 'contacts'
  post '/signup', to: 'users#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
