Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get '/users/new', to:'users#new'
  post '/users', to:'users#create'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'users#destroy'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

  get '/projects/new', to: 'projects#new'
  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show', as: 'project'


  get '/investments', to: 'investments#index', as: 'investments'
  get '/investments/new', to: 'investments#new'
  post '/investments', to: 'investments#create'

end
