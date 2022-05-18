Rails.application.routes.draw do
  # get 'tasks/index'
  get '/', to: 'tasks#index'
  get '/tasks', to: 'tasks#index'
  resources :tasks
  
end
