Rails.application.routes.draw do

  resources :users do
    resources :gleets
  end

  root   'users#show'
  get    '/signup' => 'users#new'
  get    '/login'  =>  'sessions#new', as: :login
  post   '/login' =>  'sessions#create', as: :login_create
  delete '/logout' => 'sessions#destroy'
  get    '/users/:user_id/follow' => 'follows#new', as: :follow
  get    '/users/:user_id/unfollow' => 'follows#destroy', as: :unfollow

end
