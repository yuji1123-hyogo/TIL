Rails.application.routes.draw do
  get '/login',to: 'session#new'
  post '/login',to: 'session#create'
  post '/logout',to: 'session#destroy'

  namespace :admin do
    resources :users
  end



  resources :tasks
  root to: "tasks#index"
  get 'test2/show'
  get 'test2/index'
  get 'test/show'
  get 'test/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
