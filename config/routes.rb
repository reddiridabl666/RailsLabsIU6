Rails.application.routes.draw do
  get 'euclid/index'
  get 'euclid/result'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "euclid#index"
end
