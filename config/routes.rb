Rails.application.routes.draw do
  resources :teams, only: [:destroy, :update]

  get '/home', to: 'landing#show'

  get '/profile', to: 'teams#show'
  get '/profile/edit', to: 'teams#edit'
  post '/profile/edit', to: 'teams#update'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  get '/registration', to: 'teams#new'
  post '/registration', to: 'teams#create'

end
