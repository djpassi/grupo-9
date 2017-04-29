Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/new', to:'users#new'
  post '/users', to:'users#create'

  get '/users', to: 'users#index'

  get '/projects/new', to: 'projects#new'
  post '/projects', to: 'projects#create'

  root 'home#index'
end
