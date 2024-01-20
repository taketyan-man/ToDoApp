Rails.application.routes.draw do
  post '/notice/:id' => 'notices#create'

  get '/tasks/:to_do_id/comment/:id/report' => 'comments#report'
  get '/tasks/:to_do_id/comment'  => 'comments#show'
  get '/tasks/:to_do_id/comment/new' => 'comments#new'
  post '/tasks/:to_do_id/comment/create'  => 'comments#create'
  get '/tasks/:to_do_id/comment/:id'  => 'comments#destroy'
  get '/tasks/comment/:id/edit' => 'comments#edit'
  post '/tasks/comment/:id/update' => 'comments#update'

  get '/tasks/:to_do_id/fight' => 'fights#create'
  get '/tasks/:to_do_id/fight/:id' => 'fights#destroy'

  get '/tasks/new' => 'tasks#new'
  post '/tasks/create' => 'tasks#create'
  get '/tasks/:id/edit' => 'tasks#edit'
  get '/tasks/list' => 'tasks#show'
  get '/tasks/:id' => 'tasks#yourshow'
  post '/tasks/update' => 'tasks#update'
  post '/tasks/delete' => 'tasks#delete'
  post '/tasks/:id/done' => 'tasks#done', as: 'done'
  get '/tasks' => 'tasks#index'

  get '/user/login' => 'users#yourdetil'
  post '/user/login' => 'users#login'
  get '/user/logout' => 'users#logout'
  get '/user/new' => 'users#new'
  post '/user/create' => 'users#create'
  get '/user' => "users#index"
  get '/user/show/:id' => 'users#show'
  get '/user/:id/edit' => 'users#edit'
  post '/user/:id/update' => 'users#update'
  get '/' => "home#top", as: 'home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
