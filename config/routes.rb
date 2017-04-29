Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/projects/new', to: 'projects#new'
  post '/projects', to: 'projects#create'
end
