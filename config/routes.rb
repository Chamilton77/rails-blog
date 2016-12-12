Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :comments
  get '/' => 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/settings' => 'users#edit'
  get '/delete' => 'users#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
