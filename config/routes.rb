Rails.application.routes.draw do
  get 'sessions/new'
  # get 'tasks/index'
  get '/', to: 'tasks#index'
  get '/tasks', to: 'tasks#index'
  resources :tasks
  namespace :admin do 
    resources :users 
  end  
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
end
