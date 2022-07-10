Rails.application.routes.draw do
  resources :games
  root 'users#index'
  resource :user
end
