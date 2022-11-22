Rails.application.routes.draw do
  post 'result', to: "euclid#result"
  root "euclid#index"
end
