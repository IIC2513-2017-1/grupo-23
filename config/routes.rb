Rails.application.routes.draw do
  resources :teams
  resources :comments
  resources :publications
  resources :users
  root 'welcome#index'
end
