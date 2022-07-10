Rails.application.routes.draw do
  root 'users#index'
  resource :user
end
