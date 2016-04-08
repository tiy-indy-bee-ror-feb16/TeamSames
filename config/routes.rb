Rails.application.routes.draw do
  get 'sessions/new'

  resources :users do
    resources :gleets
  end
  root   'gleets#index'
  get    '/signup' => 'users#new'
  get    '/login' => 'sessions#new', as: :login
  post   '/login' => 'sessions#create', as: :login_create
  delete '/logout' => 'sessions#destroy'
end
