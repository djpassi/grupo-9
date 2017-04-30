Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users/new', to:'users#new'
  post '/users', to:'users#create'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'users#destroy'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

  get '/projects/new', to: 'projects#new'
  post '/projects', to: 'projects#create'

  root 'home#index'

end
