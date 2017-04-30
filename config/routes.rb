Rails.application.routes.draw do
  resources :comments
  resources :publications
  resources :users
  root 'welcome#index'
end
