Rails.application.routes.draw do
  resources :users do
    resources :gleets
  end
  root 'gleets#index'
  get '/signup' => 'users#new'
end
