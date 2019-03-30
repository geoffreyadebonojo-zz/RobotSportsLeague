Rails.application.routes.draw do
  resources :teams, only: [:edit]
end
