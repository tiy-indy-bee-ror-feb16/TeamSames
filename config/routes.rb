Rails.application.routes.draw do
  root   'users#show'
  get    '/signup' => 'users#new'
  get    '/login'  => 'sessions#new', as: :login
  post   '/login'  => 'sessions#create', as: :login_create
  delete '/logout' => 'sessions#destroy'
  get    '/fresh-glitter'           => 'gleets#index', as: :glitter_index
  get    '/search/users'            => 'search#users', as: :search_users
  get    '/search/gleets'           => 'search#gleets', as: :search_gleets
  get    '/users/:user_id/follow'   => 'follows#new', as: :follow
  delete '/users/:user_id/unfollow' => 'follows#destroy', as: :unfollow
  get    '/users/:user_id/block'    => 'blockings#new', as: :block
  delete '/users/:user_id/unblock'  => 'blockings#destroy', as: :unblock

  resources :users do
    resources :gleets
  end
end
