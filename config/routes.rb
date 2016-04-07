Rails.application.routes.draw do
  resources :gleets
  resources :users
  root 'gleets#index'
  get '/signup' => 'users#new'
end
