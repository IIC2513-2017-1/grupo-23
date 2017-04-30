Rails.application.routes.draw do
  resources :publications
  resources :users
  root 'welcome#index'
end
