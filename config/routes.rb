Rails.application.routes.draw do
  get 'euclid/index'
  post 'euclid/index'

  root "euclid#index"
end
