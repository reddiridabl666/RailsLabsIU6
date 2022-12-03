Rails.application.routes.draw do
  root "euclid#result", defaults: { format: 'xml' }
  get 'result', to: "euclid#result"
  get 'transform', to: "euclid#transform"
end
