Rails.application.routes.draw do
  resources :onepages
  root 'onepages#show'

  resources :bets
  resources :teams
  resources :games
  resource :user
end
