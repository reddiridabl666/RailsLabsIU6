Rails.application.routes.draw do
  get 'euclid/result'
  root "euclid#index"
end
