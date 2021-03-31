Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :attractions
  root 'users#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/sessions' => 'sessions#destroy'
  post '/rides' => 'rides#create'
end
