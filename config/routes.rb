Rails.application.routes.draw do
  
  get '/signup', to:'users#new',as:'signup'

  root 'static_pages#home'
  get '/help', to: 'static_pages#help',as: 'help'
  get '/home', to: 'static_pages#home',as: 'home'
  get '/about', to: 'static_pages#about',as: 'about'
  get '/contacts',to: 'static_pages#contacts',as: 'contacts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
