Rails.application.routes.draw do

  resources :users do
    resources :gleets
    resources :follows
  end
  root   'gleets#index'
  get    '/signup' => 'users#new'
  get    '/login' => 'sessions#new', as: :login
  post   '/login' => 'sessions#create', as: :login_create
  delete '/logout' => 'sessions#destroy'
end
