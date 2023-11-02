Rails.application.routes.draw do
  get '/tasks/new' => 'tasks#new'
  post '/tasks/create' => 'tasks#create'
  get '/tasks/:id/edit' => 'tasks#edit'
  get '/tasks/:id' => 'tasks#show'
  post '/tasks/update' => 'tasks#update'
  post '/tasks/delete' => 'tasks#delete'
  get '/tasks' => 'tasks#index'

  get '/user/login' => 'users#detil'
  post '/user/login' => 'users#login'
  post '/user/logout' => 'users#logout'
  get '/user/new' => 'users#new'
  post '/user/create' => 'users#create'
  get '/user' => "users#index"
  get '/user/:id' => 'users#show'
  get '/user/:id/edit' => 'users#edit'
  post '/user/:id/update' => 'users#update'
  get '/' => "home#top", as: 'home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
