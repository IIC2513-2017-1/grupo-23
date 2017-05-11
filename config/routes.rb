Rails.application.routes.draw do
  resources :matches
  resources :tournaments
  resources :teams
  resources :comments
  resources :publications
  resources :users
  resource :session, only: [:new, :create, :destroy]
  root 'welcome#index'
end
