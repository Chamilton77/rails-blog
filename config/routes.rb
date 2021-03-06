Rails.application.routes.draw do
  resources :userfriends
  resources :users
  resources :posts
  resources :comments
  get '/' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/settings' => 'users#edit'
  get '/delete' => 'users#destroy'
  get '/newpost' => 'posts#new'
  get '/delpost' => 'posts#destroy'
  get '/edpost' => 'posts#edit'
  get '/find_friends' => 'users#index'
  get '/friends' => 'userfriends#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
