Rails.application.routes.draw do
  resources :teams, only: [:show, :edit, :destroy]

  get '/home', to: 'landing#show'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  get '/registration', to: 'teams#new'
  post '/registration', to: 'teams#create'

end
