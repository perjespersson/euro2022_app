Rails.application.routes.draw do
  resources :bets
  resources :teams
  resources :games
  root 'users#index'
  resource :user
end
