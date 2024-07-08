Rails.application.routes.draw do
  get '/profile/edit' => 'profiles#edit'
  post '/profile/update' => 'profiles#update'
  
  get '/tasks/notice/:id/checked' => 'notices#checked'

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
  get '/login' => 'users#yourdetil'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
 
  resources :users 
  get '/' => "home#top", as: 'home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
