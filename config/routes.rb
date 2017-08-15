Rails.application.routes.draw do

  get 'sessions/new'

  get '/signup' => 'users#new'
  post 'signup'  => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  root 'users#new'
  post '/item' => 'items#create'
  get 'item/:id'=> 'items#show'
  put '/item.:id' => 'users#monitor'
  patch '/item/:id' => 'users#monitor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   put '/item.:id' => 'users#not'
   resources :groupitems
  
end
