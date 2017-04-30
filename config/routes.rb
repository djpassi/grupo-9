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
  post '/projects', to:'projects#create'
  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show', as: 'project'
  get '/projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  patch '/projects/:id', to: 'projects#update'
  delete '/projects/:id', to: 'projects#destroy'


  get '/comments/new', to: 'comments#new'
  get '/comments', to: 'comments#index'
  get '/comments/:id', to: 'comments#show', as: 'comment'
  get '/comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
  patch '/comments/:id', to: 'comments#update'
  delete '/comments/:id', to: 'comments#destroy'
  post '/comments', to: 'comments#create'


  get '/investments', to: 'investments#index', as: 'investments'
  get '/investments/new', to: 'investments#new'
  post '/investments', to: 'investments#create'

end
