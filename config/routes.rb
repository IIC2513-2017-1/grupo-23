Rails.application.routes.draw do
  resources :matches
  resources :tournaments
  resources :teams
  resources :comments
  resources :publications do
    resources :comments
  end
  resources :users do
    resources :tournaments
  end
  post "goals/new" => "goals#create"
  post "goals/update" => "goals#update"
  resource :session, only: [:new, :create, :destroy]
  root 'welcome#index'
end
