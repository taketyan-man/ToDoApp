Rails.application.routes.draw do
  get '/profile/edit' => 'profiles#edit'
  post '/profile/update' => 'profiles#update'
  
  get '/todos/notice/:id/checked' => 'notices#checked'

    # get '/todos/:todo_id/comment/:id/report' => 'comments#report'
    # get '/todos/:todo_id/comment'  => 'comments#show'
    # get '/todos/:todo_id/comment/new' => 'comments#new'
    # post '/todos/:todo_id/comment/create'  => 'comments#create'
    # get '/todos/:todo_id/comment/:id'  => 'comments#destroy'
    # get '/todos/comment/:id/edit' => 'comments#edit'
    # post '/todos/comment/:id/update' => 'comments#update'

  get '/todos/:todo_id/fight' => 'fights#create'
  get '/todos/:todo_id/fight/:id' => 'fights#destroy'

  get '/login' => 'users#yourdetil'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
 
  resources :users
  resources :todos do
    member do
      post 'done'
    end
    resources 'comments', except: [:show] do
      member do
        get 'report'
      end
    end
  end

  get '/' => "home#top", as: 'home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
