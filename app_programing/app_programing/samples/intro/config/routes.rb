Rails.application.routes.draw do
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'hello/index', to: 'hello#index'
  get 'hello/view'
  get 'hello/list'
  get 'hello/app_var'
end
