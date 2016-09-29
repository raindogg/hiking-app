Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'treks#index'
  get '/treks/new' => 'treks#new'
  post '/treks' => 'treks#create'
  get '/treks/:id' => 'treks#show'
  get '/treks/:id/edit' => 'treks#edit'
  patch '/treks/:id' => 'treks#update'
  delete '/treks/:id' => 'treks#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users' => 'users#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
