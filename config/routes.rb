Rails.application.routes.draw do
  resources :teams
  resources :games
  root 'users#index'
  resource :user
end
