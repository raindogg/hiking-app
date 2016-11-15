Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'treks#index'
  get '/treks' => 'treks#index'
  post '/treks' => 'treks#create'
  get '/treks/:id' => 'treks#show'
  get '/treks/:id/edit' => 'treks#edit'
  patch '/treks/:id/image' => 'treks#image'
  patch '/treks/:id' => 'treks#update'
  get '/treks/:id/delete' => 'treks#destroy'

  post '/points' => 'points#create'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id/image' => 'users#image'
  patch '/users/:id/image' => 'users#updateimage'
  patch '/users/:id' => 'users#update'
  delete '/users' => 'users#destroy'
  post '/users/remote' => 'users#remote' 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/categories' => 'categories#create'
  get '/categories' => 'categories#destroy'

  post '/trek_categories' => 'trek_categories#create'
  delete '/trek_categories/:id' => 'trek_categories#destroy'

  get '/:id/friends' => 'user_friends#show'
  post '/friends' => 'user_friends#create'
end
