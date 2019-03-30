Rails.application.routes.draw do
  resources :teams, only: [:show, :edit, :new, :create, :destroy]
  get '/home', to: 'landing#show'
end
