Rails.application.routes.draw do
  resources :users
  post 'result', to: "euclid#result"

  get 'input', to: "euclid#index"
  post 'input', to: "euclid#index"

  root "session#login"
  post 'authorize', to: "session#authorize"
  get 'logout', to: "session#logout"
end
